use crate::server::error::{Result, VoicelockError};
use crate::voice::fuzzy::compute_fuzzy_hash;
use crate::voice::gmm_config::*;
use crate::voice::structures::{GmmParameters, VoicePrint, VoiceprintMetadata};
use linfa::prelude::{Fit, Predict};
use linfa::DatasetBase;
use linfa_clustering::GaussianMixtureModel;
use ndarray::{Array1, Array2};
use rmp_serde::{from_slice, to_vec};

const DBG: bool = true;

impl VoicePrint {
    /// Create a new voice-print
    pub fn new(
        speaker_id: String,
        ubm: GmmParameters,
        gmm_params: GmmParameters,
        metadata: VoiceprintMetadata,
    ) -> Self {
        Self {
            speaker_id,
            ubm,
            gmm_params,
            metadata,
        }
    }

    /// Serialize to bytes
    pub fn to_bytes(&self) -> Result<Vec<u8>> {
        to_vec(self).map_err(|e| {
            VoicelockError::Serialization(format!("Failed to serialize voice-print: {}", e))
        })
    }

    /// Deserialize from bytes
    /// Uses a 50MB size limit to prevent capacity overflow during deserialization
    pub fn from_bytes(bytes: &[u8]) -> Result<Self> {
        if bytes.len() > 50 * 1024 * 1024 {
            return Err(VoicelockError::Serialization(
                "Data too large (exceeds 50MB limit)".to_string(),
            ));
        }
        from_slice(bytes).map_err(|e| {
            VoicelockError::Serialization(format!("Failed to deserialize voice-print: {}", e))
        })
    }

    /// Compare this voiceprint with another using log-likelihood (LLR) scoring
    /// Requires UBM model and features from test audio
    /// Returns a score between 0.0 (different) and 1.0 (identical)
    ///
    /// This method computes LLR scores for both voiceprints against UBM using the same features,
    /// then compares the scores to determine similarity. Higher LLR indicates better match.
    pub fn compare_with_llr(&self, other: &VoicePrint, features: &Array2<f32>) -> Result<f32> {
        // Compute LLR for both voiceprints using the same features
        let llr_self = compute_llr_score(&self.gmm_params, &self.ubm, features);
        let llr_other = compute_llr_score(&other.gmm_params, &self.ubm, features);

        // If both voiceprints have similar high LLR scores, they're from the same speaker
        // Use the average of the two LLR scores as the similarity metric
        // This gives higher scores when both match well (same speaker)
        let avg_llr = (llr_self + llr_other) / 2.0;

        Ok(avg_llr.max(0.0).min(1.0))
    }

    /// Compare this voiceprint against UBM using LLR scoring
    /// Returns a score indicating how well features match this voiceprint vs UBM
    pub fn compare_with_ubm_llr(&self, features: &Array2<f32>) -> f32 {
        compute_llr_score(&self.gmm_params, &self.ubm, features)
    }

    /// Verify features against this voiceprint
    /// Returns a score between 0.0 (no match) and 1.0 (perfect match)
    pub fn verify(&self, features: &Array2<f32>) -> Result<f32> {
        if features.ncols() != self.gmm_params.feature_dim {
            return Err(VoicelockError::VoicePrint(
                "Feature dimension mismatch".to_string(),
            ));
        }

        let mut total_log_likelihood = 0.0;
        let num_frames = features.nrows();

        if num_frames == 0 {
            return Err(VoicelockError::VoicePrint(
                "No features provided".to_string(),
            ));
        }

        // For each frame, compute log-likelihood under GMM
        // Use log-sum-exp trick for numerical stability
        for frame in features.rows() {
            let mut log_component_probs = Vec::new();

            // Compute log-probability for each Gaussian component
            for comp in 0..self.gmm_params.n_components {
                let weight = self.gmm_params.weights[comp];
                let mean = &self.gmm_params.means[comp];
                let cov = &self.gmm_params.covariances[comp];

                // Compute Mahalanobis distance
                // Enforce minimum variance to prevent numerical issues and positive log_gaussian
                // This ensures backward compatibility with old voiceprints that may have smaller variances
                let mut mahalanobis_dist = 0.0;
                let mut log_det = 0.0; // Log determinant of covariance (diagonal)
                for (i, &val) in frame.iter().enumerate() {
                    let diff = val - mean[i];
                    let variance = cov[i].max(MIN_VARIANCE); // Enforce minimum variance
                    mahalanobis_dist += diff * diff / variance;
                    log_det += variance.ln(); // log(σ²) for diagonal covariance
                }

                // Log of Gaussian PDF: log(weight) + log(N(x|mu,sigma))
                // For multivariate Gaussian: N(x|μ,Σ) = (2π)^(-d/2) * |Σ|^(-1/2) * exp(-0.5*(x-μ)ᵀΣ⁻¹(x-μ))
                // Taking log: log(N) = -0.5*d*log(2π) - 0.5*log|Σ| - 0.5*(x-μ)ᵀΣ⁻¹(x-μ)
                // For diagonal Σ: log|Σ| = Σ log(σ²), and (x-μ)ᵀΣ⁻¹(x-μ) = Σ (x-μ)²/σ²
                // So: log(N) = -0.5*(d*log(2π) + Σ log(σ²) + Σ (x-μ)²/σ²)
                let feature_dim = frame.len() as f32;
                let normalization_constant = feature_dim * (2.0 * std::f32::consts::PI).ln();

                // Calculate log_gaussian - should always be negative for valid Gaussian PDF
                // If log_det is very negative (small variances), the sum can become negative
                // making log_gaussian positive, which indicates invalid GMM parameters
                let mut log_gaussian = -0.5 * (normalization_constant + log_det + mahalanobis_dist);

                // Sanity check: log_gaussian should be negative (Gaussian PDF is always < 1)
                // If it's positive, the GMM has invalid parameters (likely too-small variances)
                if log_gaussian > 0.0 {
                    #[cfg(target_arch = "wasm32")]
                    {
                        web_sys::console::warn_1(&format!(
                            "WARNING: Component {} has positive log_gaussian={:.2} (invalid!). norm_const={:.2}, log_det={:.2}, mahalanobis={:.2}",
                            comp, log_gaussian, normalization_constant, log_det, mahalanobis_dist
                        ).into());
                    }
                    // Clamp to a very negative value to prevent positive log-likelihood
                    // This indicates the GMM component is invalid
                    log_gaussian = -1000.0;
                }

                let log_component_prob = weight.ln() + log_gaussian;

                log_component_probs.push(log_component_prob);
            }

            // Log-sum-exp trick: log(sum(exp(x_i))) = max(x_i) + log(sum(exp(x_i - max(x_i))))
            let max_log_prob = log_component_probs
                .iter()
                .fold(f32::NEG_INFINITY, |a, &b| a.max(b));
            let mut sum_exp = 0.0;
            for &log_prob in &log_component_probs {
                sum_exp += (log_prob - max_log_prob).exp();
            }
            let frame_log_likelihood = max_log_prob + sum_exp.ln();

            total_log_likelihood += frame_log_likelihood;
        }

        // Normalize score to 0-1 range
        let avg_log_likelihood = total_log_likelihood / num_frames as f32;

        // Log likelihood values for GMM verification:
        // - Very poor match (random voice): typically -100 to -50 per frame
        // - Poor match (different speaker): typically -50 to -30 per frame
        // - Good match (same speaker): typically -30 to -10 per frame
        // - Excellent match: typically -10 to -5 per frame

        // Check if log-likelihood is suspiciously high (indicating problem)
        // With normalization constant included, typical ranges for 39-dim features:
        // - Very poor match: -150 to -100 per frame
        // - Poor match: -100 to -70 per frame
        // - Good match: -70 to -40 per frame
        // - Excellent match: -40 to -20 per frame
        // If avg_log_likelihood > -40, the GMM is likely too generic
        if avg_log_likelihood > -40.0 {
            #[cfg(target_arch = "wasm32")]
            {
                web_sys::console::warn_1(&format!(
                    "WARNING: Suspiciously high log-likelihood ({:.2}). GMM may be too generic (wide covariances) or has too few components.",
                    avg_log_likelihood
                ).into());
            }
            #[cfg(not(target_arch = "wasm32"))]
            {
                eprintln!("WARNING: Suspiciously high log-likelihood ({:.2}). GMM may be too generic (wide covariances) or has too few components.", avg_log_likelihood);
            }
        }

        // Also check if log-likelihood is suspiciously low (calculation error)
        if avg_log_likelihood < -200.0 {
            #[cfg(target_arch = "wasm32")]
            {
                web_sys::console::warn_1(
                    &format!(
                    "WARNING: Suspiciously low log-likelihood ({:.2}). Possible calculation error.",
                    avg_log_likelihood
                )
                    .into(),
                );
            }
            #[cfg(not(target_arch = "wasm32"))]
            {
                eprintln!(
                    "WARNING: Suspiciously low log-likelihood ({:.2}). Possible calculation error.",
                    avg_log_likelihood
                );
            }
        }

        // Use a more discriminative sigmoid mapping
        // Map log-likelihood range to score [0, 1]
        // Current observed range: ~-23 to -24 (very high, indicating GMM is too generic)
        // Expected range should be: -70 to -40 for good matches
        //
        // Since all values are clustering around -23 to -24, we need to:
        // 1. Use a very steep linear mapping to maximize discrimination in this narrow range
        // 2. Map small differences to larger score differences
        //
        // For observed range [-25, -22]:
        // Score mapping based on observed log-likelihood ranges
        // Iterative test shows same speaker at ~7% and different at ~6.6%
        // This means log-likelihoods are very similar, around -50 to -40
        //
        // Widen range to [-60, -20] → [0.10, 0.95]
        // Same voice: ~-35 to -30 → should map to 0.73-0.85
        // Different voice: ~-45 to -40 → should map to 0.48-0.60
        //
        let mut score = if avg_log_likelihood >= -60.0 && avg_log_likelihood <= -20.0 {
            // Linear mapping for wide range
            let normalized = (avg_log_likelihood + 60.0) / 40.0; // Normalize to [0, 1]
            let base_score = 0.10;
            let range = 0.85; // 0.95 - 0.10
            base_score + normalized * range
        } else if avg_log_likelihood > -20.0 {
            // Very high (excellent match) - cap at 0.95
            0.95
        } else {
            // Below -60 (very poor match) - use sigmoid for gradual decay to 0
            let shifted = avg_log_likelihood + 60.0; // Shift so -60 is at 0
            let sigmoid_input = 0.05 * shifted; // Gradual transition
            let sigmoid_score = 1.0 / (1.0 + (-sigmoid_input).exp());
            // Map sigmoid output to [0, 0.10]
            sigmoid_score * 0.10
        };

        // Clamp final score
        score = score.min(0.95).max(0.0);

        // Clamp score to [0, 1] range
        // Don't cap at 0.995 - allow full range for better discrimination
        Ok(score.min(1.0).max(0.0))
    }

    pub fn compute_voice_hash(&self) -> Result<Vec<u8>> {
        compute_fuzzy_hash(&self.gmm_params)
    }
}

impl GmmParameters {
    /// Create GMM parameters from raw components
    pub fn new(
        means: Vec<Vec<f32>>,
        covariances: Vec<Vec<f32>>,
        weights: Vec<f32>,
    ) -> Result<Self> {
        let n_components = means.len();
        let feature_dim = if n_components > 0 {
            means[0].len()
        } else {
            return Err(VoicelockError::GmmTraining("Empty GMM parameters".into()));
        };

        // Validation
        if covariances.len() != n_components || weights.len() != n_components {
            return Err(VoicelockError::GmmTraining(
                "Inconsistent GMM parameter dimensions".into(),
            ));
        }

        Ok(Self {
            means,
            covariances,
            weights,
            n_components,
            feature_dim,
        })
    }

    /// Create a simple GMM from features with proper statistics
    /// This computes actual means, covariances, and weights from the feature distribution
    pub fn from_features_simple(features: &Array2<f32>, n_components: usize) -> Result<Self> {
        let feature_dim = features.ncols();

        // Validate inputs
        if n_components == 0 {
            return Err(VoicelockError::GmmTraining(
                "n_components must be > 0".into(),
            ));
        }
        if features.nrows() == 0 {
            return Err(VoicelockError::GmmTraining(
                "features must have at least one row".into(),
            ));
        }

        // Use k-means-like clustering to assign features to components
        // Initialize means by sampling evenly from features
        let mut means = Vec::new();
        let step = features.nrows() / n_components.max(1);

        for i in 0..n_components {
            let idx = (i * step).min(features.nrows() - 1);
            let mean = features.row(idx).to_vec();
            means.push(mean);
        }

        // Assign each feature to nearest component (simple k-means assignment)
        let mut component_assignments = vec![0; features.nrows()];
        for (frame_idx, frame) in features.rows().into_iter().enumerate() {
            let mut best_component = 0;
            let mut min_distance = f32::MAX;

            for (comp_idx, mean) in means.iter().enumerate() {
                let mut distance = 0.0;
                for (i, &val) in frame.iter().enumerate() {
                    let diff = val - mean[i];
                    distance += diff * diff;
                }
                if distance < min_distance {
                    min_distance = distance;
                    best_component = comp_idx;
                }
            }
            component_assignments[frame_idx] = best_component;
        }

        // Compute means, covariances, and weights for each component
        let mut covariances = Vec::new();
        let mut weights = Vec::new();

        for comp_idx in 0..n_components {
            // Collect features assigned to this component
            let component_features: Vec<_> = features
                .rows()
                .into_iter()
                .enumerate()
                .filter(|(i, _)| component_assignments[*i] == comp_idx)
                .map(|(_, row)| row.to_vec())
                .collect();

            if component_features.is_empty() {
                // No features assigned - use default values
                means[comp_idx] = vec![0.0; feature_dim];
                covariances.push(vec![1.0; feature_dim]);
                weights.push(1.0 / n_components as f32);
            } else {
                // Compute mean
                let mut mean = vec![0.0; feature_dim];
                for feature in &component_features {
                    for (i, &val) in feature.iter().enumerate() {
                        mean[i] += val;
                    }
                }
                let count = component_features.len() as f32;
                for val in &mut mean {
                    *val /= count;
                }
                means[comp_idx] = mean.clone();

                // Compute covariance (diagonal)
                let mut cov = vec![0.0; feature_dim];
                for feature in &component_features {
                    for (i, &val) in feature.iter().enumerate() {
                        let diff = val - mean[i];
                        cov[i] += diff * diff;
                    }
                }
                for val in &mut cov {
                    *val = (*val / count).max(MIN_VARIANCE); // Min variance to avoid numerical issues
                }
                covariances.push(cov);

                // Compute weight (proportion of features in this component)
                weights.push(count / features.nrows() as f32);
            }
        }

        // Normalize weights to sum to 1.0
        let weight_sum: f32 = weights.iter().sum();
        if weight_sum > 0.0 {
            for w in &mut weights {
                *w /= weight_sum;
            }
        }

        Ok(Self {
            means,
            covariances,
            weights,
            n_components,
            feature_dim,
        })
    }
}

/// Adapt UBM to create speaker-specific GMM using MAP (Maximum A Posteriori) adaptation
/// This creates the actual "voice-print"
pub fn adapt_gmm_for_speaker(
    ubm: &GmmParameters,
    speaker_features: Array2<f32>,
    relevance_factor: f32,
) -> Result<GmmParameters> {
    // For simplified implementation, create speaker GMM from features
    // then apply MAP adaptation with UBM as prior
    if ubm.n_components <= 8 {
        // Create speaker-specific GMM from features
        let speaker_gmm = GmmParameters::from_features_simple(&speaker_features, ubm.n_components)?;

        // Verify speaker GMM is different from UBM (check first component mean)
        if !speaker_gmm.means.is_empty()
            && !&ubm.means.is_empty()
            && speaker_gmm.feature_dim == ubm.feature_dim
        {
            let mut mean_diff = 0.0;
            for i in 0..speaker_gmm.feature_dim.min(5) {
                let diff = speaker_gmm.means[0][i] - ubm.means[0][i];
                mean_diff += diff * diff;
            }
            mean_diff = mean_diff.sqrt();
            #[cfg(target_arch = "wasm32")]
            {
                web_sys::console::log_1(&format!("Mean difference: {}", mean_diff).into());
            }
            #[cfg(not(target_arch = "wasm32"))]
            {
                dbg_println(&String::from(format!("Mean difference: {:?}", mean_diff)));
            }
        }
        // Apply MAP adaptation: blend UBM (prior) with speaker GMM (data)
        // This ensures speaker GMM is adapted from UBM, not created independently
        let mut adapted_means = Vec::new();
        let mut adapted_covariances = Vec::new();
        let mut adapted_weights = Vec::new();

        let num_frames = speaker_features.nrows() as f32;
        let adaptation_weight = relevance_factor + num_frames;
        // Warn if speaker data has too little weight (UBM dominates)
        //let speaker_weight_ratio = num_frames / adaptation_weight;

        for comp in 0..ubm.n_components {
            // MAP adaptation of means: weighted average of UBM mean and speaker mean
            let mut adapted_mean = vec![0.0; ubm.feature_dim];
            for i in 0..ubm.feature_dim {
                adapted_mean[i] = (relevance_factor * ubm.means[comp][i]
                    + num_frames * speaker_gmm.means[comp][i])
                    / adaptation_weight;
            }
            adapted_means.push(adapted_mean);

            // MAP adaptation of covariances: blend UBM and speaker variances
            // IMPORTANT: Clamp UBM variances before blending to ensure minimum variance
            // The UBM may have small variances (0.1) that would dominate the blend
            // Increased minimum variance to prevent overly generic GMMs
            const MIN_VARIANCE: f32 = 1.0;
            let mut adapted_cov = vec![0.0; ubm.feature_dim];
            for i in 0..ubm.feature_dim {
                // Clamp UBM variance to minimum before blending
                let ubm_var = &ubm.covariances[comp][i].max(MIN_VARIANCE);
                // Speaker GMM should already have minimum variance enforced, but clamp to be safe
                let speaker_var = speaker_gmm.covariances[comp][i].max(MIN_VARIANCE);
                adapted_cov[i] =
                    (relevance_factor * ubm_var + num_frames * speaker_var) / adaptation_weight;
                // Final clamp to ensure minimum (shouldn't be needed but safety check)
                adapted_cov[i] = adapted_cov[i].max(MIN_VARIANCE);
            }
            adapted_covariances.push(adapted_cov);

            // MAP adaptation of weights: blend UBM and speaker weights
            let adapted_weight = (relevance_factor * &ubm.weights[comp]
                + num_frames * speaker_gmm.weights[comp])
                / adaptation_weight;
            adapted_weights.push(adapted_weight);
        }

        // Normalize weights
        let weight_sum: f32 = adapted_weights.iter().sum();
        if weight_sum > 0.0 {
            for w in &mut adapted_weights {
                *w /= weight_sum;
            }
        }

        // Check for weight concentration - if one component has > 80% weight, it's problematic
        let max_weight = adapted_weights.iter().cloned().fold(0.0f32, f32::max);
        if max_weight > 0.8 {
            #[cfg(target_arch = "wasm32")]
            {
                web_sys::console::warn_1(&format!(
                    "WARNING: GMM has concentrated weight (max={:.1}%). GMM may be too generic or needs more data.",
                    max_weight * 100.0
                ).into());
            }
        }

        let adapted_gmm = GmmParameters::new(adapted_means, adapted_covariances, adapted_weights)?;

        // Log GMM creation for debugging
        #[cfg(target_arch = "wasm32")]
        {
            web_sys::console::log_1(&format!(
                "Created speaker GMM via MAP adaptation: {} components, {} frames, relevance_factor={}",
                adapted_gmm.n_components, num_frames, relevance_factor
            ).into());
        }
        #[cfg(not(target_arch = "wasm32"))]
        {
            dbg_println(&String::from(format!("Created speaker GMM via MAP adaptation: {} components, {} frames, relevance_factor={}",
                adapted_gmm.n_components, num_frames, relevance_factor)));
        }

        // Log sample mean and covariance values to verify uniqueness
        if adapted_gmm.n_components > 0 && adapted_gmm.feature_dim > 0 {
            let sample_mean = &adapted_gmm.means[0];
            let sample_cov = &adapted_gmm.covariances[0];
            let mean_sum: f32 = sample_mean.iter().take(5).sum(); // Sum of first 5 dimensions
            let cov_avg: f32 = sample_cov.iter().take(5).sum::<f32>() / 5.0; // Average of first 5 variances
            #[cfg(target_arch = "wasm32")]
            {
                web_sys::console::log_1(&format!(
                    "Speaker GMM sample: mean[0] first 5 dims sum={:.4}, cov[0] first 5 dims avg={:.4} (should differ between speakers)",
                    mean_sum, cov_avg
                ).into());
            }
            #[cfg(not(target_arch = "wasm32"))]
            {
                dbg_println(&String::from(format!("Speaker GMM sample: mean[0] first 5 dims sum={:.4}, cov[0] first 5 dims avg={:.4} (should differ between speakers)",
                    mean_sum, cov_avg)));
            }

            // Check if covariances are suspiciously large (indicating generic GMM)
            if cov_avg > 10.0 {
                #[cfg(target_arch = "wasm32")]
                {
                    web_sys::console::warn_1(
                        &format!(
                            "WARNING: Large covariance values (avg={:.4}). GMM may be too generic.",
                            cov_avg
                        )
                        .into(),
                    );
                }
                #[cfg(not(target_arch = "wasm32"))]
                {
                    dbg_println(&String::from(format!(
                        "WARNING: Large covariance values (avg={:.4}). GMM may be too generic.",
                        cov_avg
                    )));
                }
            }
        }

        return Ok(adapted_gmm);
    }

    // Try full GMM training for larger component counts
    let targets = Array1::<f32>::zeros(speaker_features.nrows());
    let dataset = DatasetBase::new(speaker_features.clone(), targets);

    match GaussianMixtureModel::params(ubm.n_components)
        .tolerance(1e-3)
        .max_n_iterations(50)
        .fit(&dataset)
    {
        Ok(fitted_gmm) => {
            let gmm_params = extract_gmm_parameters_from_model(&fitted_gmm, &speaker_features)?;
            Ok(gmm_params)
        }
        Err(_) => GmmParameters::from_features_simple(&speaker_features, ubm.n_components),
    }
}

/// Extract GMM parameters from linfa's GaussianMixtureModel
pub fn extract_gmm_parameters_from_model(
    fitted_gmm: &GaussianMixtureModel<f32>,
    features: &Array2<f32>,
) -> Result<GmmParameters> {
    // Use predict to get cluster assignments
    // GMM predict returns a DatasetBase with cluster assignments as targets
    let targets = Array1::<f32>::zeros(features.nrows());
    let dataset = DatasetBase::new(features.clone(), targets);
    let prediction_result = fitted_gmm.predict(dataset);
    // GMM predictions are stored as f32 in targets, convert to usize
    let predictions: Vec<usize> = prediction_result
        .targets
        .iter()
        .map(|&x| x as usize)
        .collect();
    // Infer n_components from predictions
    let n_components = if predictions.is_empty() {
        return Err(VoicelockError::GmmTraining(
            "No predictions from GMM".into(),
        ));
    } else {
        predictions.iter().max().map(|&x| x + 1).unwrap_or(1)
    };
    let feature_dim = features.ncols();

    // Note: linfa's GMM API may not directly expose means/covariances
    // This is a simplified extraction - adjust based on actual linfa API
    // For now, create a simplified GMM based on clustering
    let mut means = Vec::new();
    let mut covariances = Vec::new();

    // Calculate means and covariances for each component
    for component_idx in 0..n_components {
        let component_samples: Vec<_> = features
            .rows()
            .into_iter()
            .enumerate()
            .filter(|(i, _)| predictions[*i] == component_idx)
            .map(|(_, row)| row)
            .collect();

        if component_samples.is_empty() {
            // Use random initialization for empty components
            means.push(vec![0.0; feature_dim]);
            covariances.push(vec![1.0; feature_dim]);
        } else {
            // Calculate mean
            let mut mean = vec![0.0; feature_dim];
            for sample in &component_samples {
                for (i, &val) in sample.iter().enumerate() {
                    mean[i] += val;
                }
            }
            for val in &mut mean {
                *val /= component_samples.len() as f32;
            }

            // Calculate diagonal covariance
            let mut cov = vec![0.0; feature_dim];
            for sample in &component_samples {
                for (i, &val) in sample.iter().enumerate() {
                    let diff = val - mean[i];
                    cov[i] += diff * diff;
                }
            }
            for val in &mut cov {
                *val = (*val / component_samples.len() as f32).max(1.0); // Min variance (increased to prevent overly generic GMMs)
            }

            means.push(mean);
            covariances.push(cov);
        }
    }

    // Calculate weights based on cluster sizes
    let mut weights = vec![0.0; n_components];
    for &pred in &predictions {
        weights[pred] += 1.0;
    }
    let total = weights.iter().sum::<f32>();
    for w in &mut weights {
        *w /= total;
    }

    GmmParameters::new(means, covariances, weights)
}

/// Incrementally adapt an existing speaker GMM with new features using MAP adaptation
/// This updates the existing GMM rather than creating a new one from scratch
///
/// # Arguments
/// * `existing_gmm` - The current speaker GMM to update
/// * `new_features` - Features from the new recording(s)
/// * `relevance_factor` - Controls how much weight to give existing model vs new data
///
/// # Returns
/// Updated GMM parameters
pub fn adapt_gmm_incrementally(
    gmm_params: &GmmParameters,
    new_features: Array2<f32>,
    relevance_factor: f32,
) -> Result<GmmParameters> {
    // Use default normalization (no normalization)
    adapt_gmm_incrementally_with_normalization(gmm_params, new_features, relevance_factor, 0.0)
}

/// Incremental GMM adaptation with frame count normalization
/// Normalizes frame counts so each recording contributes equally regardless of length
pub fn adapt_gmm_incrementally_with_normalization(
    gmm_params: &GmmParameters,
    new_features: Array2<f32>,
    relevance_factor: f32,
    normalization_target: f32,
) -> Result<GmmParameters> {
    // Validate dimensions match
    if gmm_params.feature_dim != new_features.ncols() {
        return Err(VoicelockError::GmmTraining(format!(
            "Feature dimension mismatch: existing {} vs new {}",
            gmm_params.feature_dim,
            new_features.ncols()
        )));
    }

    if new_features.nrows() == 0 {
        return Err(VoicelockError::GmmTraining(
            "No new features provided".into(),
        ));
    }

    let n_components = gmm_params.n_components;
    let feature_dim = gmm_params.feature_dim;

    // Compute statistics from new features for each component
    // We'll use a simplified approach: assign frames to nearest component
    let mut new_means = vec![vec![0.0; feature_dim]; n_components];
    let mut new_covariances = vec![vec![0.0; feature_dim]; n_components];
    let mut component_frame_counts = vec![0.0; n_components];

    // Assign each frame to the component with highest likelihood
    for frame in new_features.rows() {
        let mut best_component = 0;
        let mut best_likelihood = f32::NEG_INFINITY;

        for comp in 0..n_components {
            let weight = gmm_params.weights[comp];
            let mean = &gmm_params.means[comp];
            let cov = &gmm_params.covariances[comp];

            // Compute Gaussian likelihood (simplified)
            let mut mahalanobis_dist = 0.0;
            for (i, &val) in frame.iter().enumerate() {
                let diff = val - mean[i];
                mahalanobis_dist += diff * diff / cov[i].max(1.0);
            }

            let likelihood = weight * (-0.5 * mahalanobis_dist).exp();
            if likelihood > best_likelihood {
                best_likelihood = likelihood;
                best_component = comp;
            }
        }

        // Accumulate statistics for this component
        component_frame_counts[best_component] += 1.0;
        for (i, &val) in frame.iter().enumerate() {
            new_means[best_component][i] += val;
        }
    }

    // Compute means for new data
    for comp in 0..n_components {
        if component_frame_counts[comp] > 0.0 {
            for i in 0..feature_dim {
                new_means[comp][i] /= component_frame_counts[comp];
            }
        } else {
            // No frames assigned to this component, use existing mean
            new_means[comp] = gmm_params.means[comp].clone();
        }
    }

    // Compute covariances for new data
    for frame in new_features.rows() {
        let mut best_component = 0;
        let mut best_likelihood = f32::NEG_INFINITY;

        for comp in 0..n_components {
            let weight = gmm_params.weights[comp];
            let mean = &gmm_params.means[comp];
            let cov = &gmm_params.covariances[comp];

            let mut mahalanobis_dist = 0.0;
            for (i, &val) in frame.iter().enumerate() {
                let diff = val - mean[i];
                mahalanobis_dist += diff * diff / cov[i].max(1.0);
            }

            let likelihood = weight * (-0.5 * mahalanobis_dist).exp();
            if likelihood > best_likelihood {
                best_likelihood = likelihood;
                best_component = comp;
            }
        }

        if component_frame_counts[best_component] > 0.0 {
            let new_mean = &new_means[best_component];
            for (i, &val) in frame.iter().enumerate() {
                let diff = val - new_mean[i];
                new_covariances[best_component][i] += diff * diff;
            }
        }
    }

    // Normalize covariances
    for comp in 0..n_components {
        if component_frame_counts[comp] > 0.0 {
            for i in 0..feature_dim {
                new_covariances[comp][i] /= component_frame_counts[comp];
                new_covariances[comp][i] = new_covariances[comp][i].max(1.0);
                // Min variance (increased to prevent overly generic GMMs)
            }
        } else {
            // No frames assigned, use existing covariance
            new_covariances[comp] = gmm_params.covariances[comp].clone();
        }
    }

    // Calculate normalization factor to ensure each recording contributes equally
    // regardless of length (prevents longer recordings from dominating)
    let total_new_frames: f32 = component_frame_counts.iter().sum();
    let normalization_factor = if normalization_target > 0.0 && total_new_frames > 0.0 {
        normalization_target / total_new_frames
    } else {
        1.0 // No normalization
    };

    // Apply MAP adaptation to update means and covariances
    let mut updated_means = Vec::new();
    let mut updated_covariances = Vec::new();
    let mut updated_weights = Vec::new();

    for comp in 0..n_components {
        let mut updated_mean = vec![0.0; feature_dim];
        let mut updated_cov = vec![0.0; feature_dim];

        // Use normalized frame counts for MAP adaptation
        let normalized_count = component_frame_counts[comp] * normalization_factor;

        if normalized_count > 0.0 {
            // MAP adaptation: blend old and new parameters
            let adaptation_weight = relevance_factor + normalized_count;

            for i in 0..feature_dim {
                // Update mean: weighted average of old and new
                updated_mean[i] = (relevance_factor * gmm_params.means[comp][i]
                    + normalized_count * new_means[comp][i])
                    / adaptation_weight;

                // Update covariance: blend old and new variances
                // IMPORTANT: Clamp both old and new variances before blending to ensure minimum variance
                const MIN_VARIANCE: f32 = 1.0;
                let old_var = gmm_params.covariances[comp][i].max(MIN_VARIANCE);
                let new_var = new_covariances[comp][i].max(MIN_VARIANCE);
                updated_cov[i] =
                    (relevance_factor * old_var + normalized_count * new_var) / adaptation_weight;
                // Final clamp to ensure minimum (shouldn't be needed but safety check)
                updated_cov[i] = updated_cov[i].max(MIN_VARIANCE);
            }
        } else {
            // No new data for this component, keep existing parameters
            updated_mean = gmm_params.means[comp].clone();
            updated_cov = gmm_params.covariances[comp].clone();
        }

        updated_means.push(updated_mean);
        updated_covariances.push(updated_cov);
    }

    // Update weights: blend old weights with normalized frame counts
    let total_normalized_frames: f32 = total_new_frames * normalization_factor;
    if total_normalized_frames > 0.0 {
        let total_adaptation_weight = relevance_factor + total_normalized_frames;
        for comp in 0..n_components {
            let old_weight = gmm_params.weights[comp];
            let normalized_comp_count = component_frame_counts[comp] * normalization_factor;
            let new_weight = normalized_comp_count / total_normalized_frames;
            updated_weights.push(
                (relevance_factor * old_weight + total_normalized_frames * new_weight)
                    / total_adaptation_weight,
            );
        }
    } else {
        // No frames assigned, keep existing weights
        updated_weights = gmm_params.weights.clone();
    }

    // Normalize weights to sum to 1.0
    let weight_sum: f32 = updated_weights.iter().sum();
    if weight_sum > 0.0 {
        for w in &mut updated_weights {
            *w /= weight_sum;
        }
    }

    GmmParameters::new(updated_means, updated_covariances, updated_weights)
}

/// Generate synthetic features from a GMM by sampling from its components
/// This creates representative features for LLR-based comparison
///
/// Samples components according to their weights and uses the mean vector
/// of each selected component as a feature frame
pub fn generate_features_from_gmm(gmm: &GmmParameters, n_frames: usize) -> Result<Array2<f32>> {
    use rand::RngExt;
    let mut rng = rand::rng();
    let mut features = Vec::new();

    for _ in 0..n_frames {
        // Sample a component according to weights
        let rand_val: f32 = rng.random();
        let mut cumsum = 0.0;
        let mut selected_comp = 0;

        for (i, &weight) in gmm.weights.iter().enumerate() {
            cumsum += weight;
            if rand_val <= cumsum {
                selected_comp = i;
                break;
            }
        }

        // Use the mean of the selected component as the feature vector
        // This represents the "typical" feature for this component
        let frame = gmm.means[selected_comp].clone();
        features.push(frame);
    }

    // Convert to Array2
    let nrows = features.len();
    let ncols = if nrows > 0 {
        features[0].len()
    } else {
        gmm.feature_dim
    };
    let flat: Vec<f32> = features.into_iter().flatten().collect();
    Array2::from_shape_vec((nrows, ncols), flat)
        .map_err(|e| VoicelockError::VoicePrint(format!("Failed to create feature array: {}", e)))
}

/// Compare fuzzy hashes with sensitivity adjustment
///
/// # Parameters
/// - `hash1`, `hash2`: The fuzzy hashes to compare
/// - `sensitivity_factor`: Multiplier to adjust sensitivity (1.0 = no change, >1.0 = more sensitive, <1.0 = less sensitive)
/// - `min_threshold`: Minimum score to consider (scores below this are set to 0)
///
/// # Returns
/// Adjusted similarity score (0-100)
pub fn compare_fuzzy_hashes_with_sensitivity(
    hash1: &Vec<u8>,
    hash2: &Vec<u8>,
    sensitivity_factor: f32,
    min_threshold: u32,
) -> Result<u32> {
    crate::voice::fuzzy::compare_fuzzy_hashes_with_sensitivity(
        hash1,
        hash2,
        sensitivity_factor,
        min_threshold,
    )
}

/// Compare two GMMs using log-likelihood ratio scoring
/// This is more discriminative than cosine similarity for voiceprint comparison
///
/// Uses test features to compute how well they match the reference GMM vs UBM
/// Returns a score between 0.0 (different speaker) and 1.0 (same speaker)
pub fn compute_gmm_similarity_llr(
    reference_gmm: &GmmParameters,
    ubm: &GmmParameters,
    test_features: &ndarray::Array2<f32>,
) -> f32 {
    compute_llr_score(reference_gmm, ubm, test_features)
}

/// Compute raw log-likelihood ratio (for debugging)
/// Returns the average per-frame log-likelihood ratio without mapping
pub fn compute_raw_llr(
    speaker_gmm: &GmmParameters,
    ubm: &GmmParameters,
    features: &ndarray::Array2<f32>,
) -> f32 {
    let n_frames = features.nrows();
    if n_frames == 0 {
        return 0.0;
    }

    let mut total_llr = 0.0;

    for frame_idx in 0..n_frames {
        let frame: Vec<f32> = (0..features.ncols())
            .map(|j| features[[frame_idx, j]])
            .collect();

        let ll_speaker = compute_frame_log_likelihood(&frame, speaker_gmm);
        let ll_ubm = compute_frame_log_likelihood(&frame, ubm);

        // Log-likelihood ratio
        total_llr += ll_speaker - ll_ubm;
    }

    total_llr / n_frames as f32
}

/// Compute log-likelihood ratio score between speaker GMM and UBM
/// Returns the average per-frame log-likelihood ratio, mapped to [0, 1]
pub fn compute_llr_score(
    speaker_gmm: &GmmParameters,
    ubm: &GmmParameters,
    features: &ndarray::Array2<f32>,
) -> f32 {
    let avg_llr = compute_raw_llr(speaker_gmm, ubm, features);

    // Map LLR to [0, 1] range using configuration thresholds
    // See gmm_config.rs for threshold and score range definitions
    // Note: Based on observed data analysis, same speakers have LLR ~0.8-1.6 (positive)
    //       Early recordings (with fewer samples) may have LLR ~0.7-0.9
    //       Well-adapted voiceprints (with more samples) have LLR ~1.0-1.6
    //       Different speakers have wider range (-0.64 to 2.93)
    //       Strategy: Map values in the 0.8-1.6 range to HIGH scores (0.7-1.0)
    //                 Map values outside this range to LOWER scores
    //       Adjusted thresholds to better match observed performance data

    // Invert the mapping: same speakers (LLR 0.8-2.0) should get HIGH scores
    // Extended upper bound to 2.0 to accommodate well-adapted voiceprints with high LLR
    let score = if avg_llr >= 0.8 && avg_llr <= 2.0 {
        // Same speaker range (0.8 to 2.0): map to HIGH scores (0.7 to 1.0)
        let range_size = 2.0 - 0.8; // 1.2
        let normalized = (avg_llr - 0.8) / range_size; // [0, 1] as avg_llr goes from 0.8 to 2.0
        let score_min = 0.7;
        let score_max = 1.0;
        let score_range = score_max - score_min; // 0.3
        score_min + normalized * score_range
    } else if avg_llr >= 0.6 && avg_llr < 0.8 {
        // Transition zone below same speaker range: map to medium-high (0.5 to 0.7)
        // This catches early recordings that are still adapting
        let range_size = 0.8 - 0.6; // 0.2
        let normalized = (avg_llr - 0.6) / range_size; // [0, 1] as avg_llr goes from 0.6 to 0.8
        let score_min = 0.5;
        let score_max = 0.7;
        let score_range = score_max - score_min; // 0.2
        score_min + normalized * score_range
    } else if avg_llr > 2.0 && avg_llr <= 2.8 {
        // Transition zone above same speaker range: map to medium (0.3 to 0.5)
        let range_size = 2.8 - 2.0; // 0.8
        let normalized = (avg_llr - 2.0) / range_size; // [0, 1] as avg_llr goes from 2.0 to 2.8
        let score_min = 0.3;
        let score_max = 0.5;
        let score_range = score_max - score_min; // 0.2
        score_min + normalized * score_range
    } else if avg_llr < 0.6 {
        // Low LLR (negative or very low positive): different speaker, low confidence → [0.0, 0.5]
        let range_size = 0.6 - LLR_NORMALIZATION_LOWER_BOUND; // 0.6 - (-5.0) = 5.6
        let normalized = ((avg_llr - LLR_NORMALIZATION_LOWER_BOUND) / range_size)
            .max(0.0)
            .min(1.0);
        let score_min = 0.0;
        let score_max = 0.5;
        let score_range = score_max - score_min; // 0.5
        score_min + normalized * score_range
    } else {
        // High LLR (> 2.4): different speaker, high confidence → [0.0, 0.3]
        let range_size = LLR_NORMALIZATION_UPPER_BOUND - 2.4; // 5.0 - 2.4 = 2.6
        let normalized = ((avg_llr - 2.4) / range_size).max(0.0).min(1.0);
        let score_min = 0.0;
        let score_max = 0.3;
        let score_range = score_max - score_min; // 0.3
        score_min + (1.0 - normalized) * score_range // Invert so higher LLR = lower score
    };

    score.max(0.0).min(1.0)
}

/// Compute log-likelihood of a single frame under a GMM
pub fn compute_frame_log_likelihood(frame: &[f32], gmm: &GmmParameters) -> f32 {
    let n_components = gmm.n_components;
    let n_dims = gmm.feature_dim;

    // Compute weighted sum of component likelihoods
    let mut max_log_prob = f32::NEG_INFINITY;
    let mut log_probs = Vec::with_capacity(n_components);

    for k in 0..n_components {
        let weight = gmm.weights[k];
        if weight <= 0.0 {
            continue;
        }

        // Compute Gaussian log-probability for this component
        let mut log_prob = weight.ln();
        let mut mahalanobis = 0.0;
        let mut log_det = 0.0;

        for d in 0..n_dims {
            let diff = frame[d] - gmm.means[k][d];
            let var = gmm.covariances[k][d].max(MIN_VARIANCE);
            mahalanobis += diff * diff / var;
            log_det += var.ln();
        }

        // Multivariate Gaussian log-probability (diagonal covariance)
        log_prob -=
            0.5 * (n_dims as f32 * (2.0 * std::f32::consts::PI).ln() + log_det + mahalanobis);

        log_probs.push(log_prob);
        if log_prob > max_log_prob {
            max_log_prob = log_prob;
        }
    }

    if log_probs.is_empty() {
        return f32::NEG_INFINITY;
    }

    // Log-sum-exp for numerical stability
    let sum_exp: f32 = log_probs.iter().map(|&lp| (lp - max_log_prob).exp()).sum();
    max_log_prob + sum_exp.ln()
}

pub fn dbg_println(msg: &str) {
    if DBG {
        println!("{}", msg);
    }
}
