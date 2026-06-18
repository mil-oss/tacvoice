use crate::audio::capture::capture_audio;
use crate::audio::config::{
    ENERGY_THRESHOLD, NUMBER_GMM_COMPONENTS, PRE_EMPHASIS_COEFFICENT, RELEVANCE_FACTOR,
};
use crate::audio::features::extract_mfcc_features;
use crate::audio::preprocessing::{normalize_audio, pre_emphasis, remove_silence};
use crate::audio::structures::{
    AudioCaptureConfig, MfccConfig, PipelineConfig, VerificationResult,
};
use crate::server::error::{Result, VoicelockError};
use crate::voice::fuzzy::compute_fuzzy_hash;
use crate::voice::structures::{GmmParameters, VoicePrint};
use crate::voice::voiceprint::adapt_gmm_for_speaker;
use ndarray::Array2;

const DBG: bool = false;

fn dbg_println(msg: &str) {
    if DBG {
        println!("{}", msg);
    }
}

impl Default for PipelineConfig {
    fn default() -> Self {
        Self {
            audio_config: AudioCaptureConfig::default(),
            mfcc_config: MfccConfig::default(),
            n_gmm_components: NUMBER_GMM_COMPONENTS, // 32 components for speaker model
            relevance_factor: RELEVANCE_FACTOR,      // MAP adaptation relevance factor
            energy_threshold: ENERGY_THRESHOLD,      // VAD energy threshold
            pre_emphasis_coef: PRE_EMPHASIS_COEFFICENT, // Pre-emphasis coefficient
        }
    }
}

/// Process audio samples through the full feature extraction pipeline
pub fn process_audio(mut samples: Vec<f32>, config: &PipelineConfig) -> Result<Array2<f32>> {
    dbg_println(&format!("Processing audio: {} samples", samples.len()));

    // 1. Normalize audio
    normalize_audio(&mut samples);

    // 2. Remove silence using VAD
    let frame_size =
        (config.mfcc_config.sample_rate as usize * config.mfcc_config.frame_size_ms) / 1000;
    let voice_samples = remove_silence(&samples, frame_size, config.energy_threshold);

    if voice_samples.is_empty() {
        return Err(VoicelockError::AudioProcessing(
            "No voice activity detected in audio".into(),
        ));
    }

    dbg_println(&format!(
        "Voice activity: {}/{} samples",
        voice_samples.len(),
        samples.len()
    ));

    // 3. Apply pre-emphasis filter
    let emphasized = pre_emphasis(&voice_samples, config.pre_emphasis_coef);

    // 4. Extract MFCC features
    let features = extract_mfcc_features(&emphasized, &config.mfcc_config)?;

    dbg_println(&format!("Extracted features: {:?}", features.dim()));

    Ok(features)
}

/// Verify a speaker from live microphone capture
pub fn verify_from_microphone(
    voice_print: &VoicePrint,
    config: &PipelineConfig,
) -> Result<VerificationResult> {
    dbg_println(&format!("Verifying speaker '{}'", voice_print.speaker_id));
    dbg_println(&format!("\n Recording verification utterance"));
    dbg_println(&format!(
        "Speak now for {} seconds...",
        config.audio_config.duration_secs
    ));

    // Capture audio
    let samples = capture_audio(&config.audio_config)?;

    // Verify from samples
    verify_from_audio(voice_print, samples, config)
}

/// Verify a speaker from audio
pub fn verify_from_audio(
    voice_print: &VoicePrint,
    samples: Vec<f32>,
    config: &PipelineConfig,
) -> Result<VerificationResult> {
    // Extract features
    let features = process_audio(samples, config)?;
    // Create test GMM
    let test_gmm = adapt_gmm_for_speaker(&voice_print.ubm, features, config.relevance_factor)?;
    // Compute similarity (simplified: compare hashs)
    let enrolled_hash = voice_print.compute_voice_hash()?;
    let test_hash = compute_fuzzy_hash(&test_gmm)?;
    // For exact match, hashs should be identical
    // In practice, use likelihood ratio or cosine similarity on GMM parameters
    let is_exact_match = enrolled_hash == test_hash;
    // Compute similarity score (simplified)
    let similarity_score = compute_gmm_similarity(&voice_print.gmm_params, &test_gmm);
    let threshold = 0.80; // 80% similarity threshold
    let is_verified = similarity_score >= threshold;
    dbg_println(&format!(
        "Verification result: score={:.4}, verified={}",
        similarity_score, is_verified
    ));
    Ok(VerificationResult {
        speaker_id: voice_print.speaker_id.clone(),
        similarity_score,
        threshold,
        is_verified,
        is_exact_match,
    })
}

/// Compute similarity between two GMMs (simplified)
/// In production, use log-likelihood ratio or proper GMM distance metric
fn compute_gmm_similarity(gmm1: &GmmParameters, gmm2: &GmmParameters) -> f32 {
    if gmm1.n_components != gmm2.n_components || gmm1.feature_dim != gmm2.feature_dim {
        return 0.0;
    }

    // Simple Euclidean distance between means
    let mut total_distance = 0.0_f32;
    let mut count = 0.0_f32;

    for i in 0..gmm1.n_components {
        for j in 0..gmm1.feature_dim {
            let diff = gmm1.means[i][j] - gmm2.means[i][j];
            total_distance += diff * diff;
            count += 1.0;
        }
    }

    let mean_distance = (total_distance / count).sqrt();

    // Convert distance to similarity (0-1 range)
    // Lower distance = higher similarity
    let similarity = (-mean_distance).exp();

    similarity
}
