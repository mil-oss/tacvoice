/// GMM and voiceprint configuration parameters
///
/// Centralized configuration for all tunable parameters used in GMM training,
/// voiceprint comparison, and LLR scoring. Adjust these values to fine-tune
/// the voiceprint matching behavior.
use crate::voice::structures::GmmVoiceprintParameters;

/// Minimum variance for GMM components
/// Prevents numerical issues and ensures backward compatibility with old voiceprints
pub const MIN_VARIANCE: f32 = 1.0;

/// LLR Scoring Configuration
///
/// These thresholds control how raw log-likelihood ratio (LLR) values are mapped
/// to similarity scores in the range [0.0, 1.0].
///
/// Based on observed performance data analysis:
/// - Same speakers (individual voiceprints): LLR around 0.8 to 1.6 (positive values)
/// - Early recordings (fewer samples): LLR ~0.7-0.9 (still adapting)
/// - Well-adapted voiceprints (more samples): LLR ~1.0-1.6 (better discrimination)
/// - Different speakers (test speakers): LLR ranging from -0.64 to 2.93
///
/// Strategy: Map LLR values in the 0.8-1.6 range (same speaker) to HIGH scores (0.7-1.0)
///           Map LLR values outside this range to LOWER scores
///           Adjusted thresholds to better match observed performance and account for
///           incremental adaptation improving scores with more samples

/// Very negative LLR threshold - scores below this are considered same speaker (high confidence)
pub const LLR_THRESHOLD_VERY_NEGATIVE: f32 = -2.0;

/// Negative LLR threshold - transition point for high-confidence same speaker
pub const LLR_THRESHOLD_NEGATIVE: f32 = 0.0;

/// Moderate LLR threshold - transition zone between same and different
pub const LLR_THRESHOLD_MODERATE: f32 = 1.0;

/// Less negative LLR threshold - transition point for different speaker
pub const LLR_THRESHOLD_LESS_NEGATIVE: f32 = 2.5;

/// Score mapping ranges for LLR thresholds
///
/// These define the score ranges [min, max] for each LLR threshold band:
/// - Very negative (< THRESHOLD_VERY_NEGATIVE): same speaker → [VERY_NEGATIVE_MIN, VERY_NEGATIVE_MAX]
/// - Negative (THRESHOLD_VERY_NEGATIVE to THRESHOLD_NEGATIVE): same speaker → [NEGATIVE_MIN, NEGATIVE_MAX]
/// - Moderate (THRESHOLD_NEGATIVE to THRESHOLD_MODERATE): transition → [MODERATE_MIN, MODERATE_MAX]
/// - Less negative (THRESHOLD_MODERATE to THRESHOLD_LESS_NEGATIVE): different speaker → [LESS_NEGATIVE_MIN, LESS_NEGATIVE_MAX]
/// - Near-zero (> THRESHOLD_LESS_NEGATIVE): different speaker → [NEAR_ZERO_MIN, NEAR_ZERO_MAX]

/// Very negative LLR score range (same speaker, high confidence)
pub const LLR_SCORE_VERY_NEGATIVE_MIN: f32 = 0.80;
pub const LLR_SCORE_VERY_NEGATIVE_MAX: f32 = 1.00;

/// Negative LLR score range (same speaker, medium-high confidence)
pub const LLR_SCORE_NEGATIVE_MIN: f32 = 0.60;
pub const LLR_SCORE_NEGATIVE_MAX: f32 = 0.80;

/// Moderate LLR score range (transition zone, uncertain)
pub const LLR_SCORE_MODERATE_MIN: f32 = 0.40;
pub const LLR_SCORE_MODERATE_MAX: f32 = 0.60;

/// Less negative LLR score range (different speaker, medium-low confidence)
pub const LLR_SCORE_LESS_NEGATIVE_MIN: f32 = 0.20;
pub const LLR_SCORE_LESS_NEGATIVE_MAX: f32 = 0.40;

/// Near-zero LLR score range (different speaker, high confidence)
pub const LLR_SCORE_NEAR_ZERO_MIN: f32 = 0.00;
pub const LLR_SCORE_NEAR_ZERO_MAX: f32 = 0.20;

/// Normalization bounds for LLR mapping
/// Used to handle edge cases where LLR values fall outside the threshold ranges

/// Lower bound for very negative LLR normalization
/// Values below this will be clamped to LLR_SCORE_VERY_NEGATIVE_MAX
pub const LLR_NORMALIZATION_LOWER_BOUND: f32 = -5.0;

/// Upper bound for near-zero LLR normalization
/// Values above this will be clamped to LLR_SCORE_NEAR_ZERO_MIN
pub const LLR_NORMALIZATION_UPPER_BOUND: f32 = 5.0;

/// Fuzzy Hash Comparison Configuration
///
/// ssdeep fuzzy hash comparison sensitivity settings
/// ssdeep returns scores 0-100 representing percentage similarity
///
/// Sensitivity adjustment:
/// - sensitivity_factor > 1.0: More sensitive (emphasizes differences)
/// - sensitivity_factor = 1.0: No adjustment (use raw ssdeep score)
/// - sensitivity_factor < 1.0: Less sensitive (reduces differences)
///
/// min_threshold: Minimum raw score to consider (scores below this are treated as 0)
/// This helps filter out very low-confidence matches

/// Fuzzy hash sensitivity factor (1.0 = no adjustment)
/// Higher values make the comparison more sensitive to differences
pub const FUZZY_HASH_SENSITIVITY_FACTOR: f32 = 1.0;

/// Minimum fuzzy hash score threshold (0-100)
/// Scores below this are treated as 0 (no match)
/// Set to 0 to disable threshold filtering
pub const FUZZY_HASH_MIN_THRESHOLD: u32 = 0;

impl Default for GmmVoiceprintParameters {
    fn default() -> Self {
        Self {
            min_variance: MIN_VARIANCE,
            llr_threshold_very_negative: LLR_THRESHOLD_VERY_NEGATIVE,
            llr_threshold_negative: LLR_THRESHOLD_NEGATIVE,
            llr_threshold_moderate: LLR_THRESHOLD_MODERATE,
            llr_threshold_less_negative: LLR_THRESHOLD_LESS_NEGATIVE,
            llr_score_very_negative_min: LLR_SCORE_VERY_NEGATIVE_MIN,
            llr_score_very_negative_max: LLR_SCORE_VERY_NEGATIVE_MAX,
            llr_score_negative_min: LLR_SCORE_NEGATIVE_MIN,
            llr_score_negative_max: LLR_SCORE_NEGATIVE_MAX,
            llr_score_moderate_min: LLR_SCORE_MODERATE_MIN,
            llr_score_moderate_max: LLR_SCORE_MODERATE_MAX,
            llr_score_less_negative_min: LLR_SCORE_LESS_NEGATIVE_MIN,
            llr_score_less_negative_max: LLR_SCORE_LESS_NEGATIVE_MAX,
            llr_score_near_zero_min: LLR_SCORE_NEAR_ZERO_MIN,
            llr_score_near_zero_max: LLR_SCORE_NEAR_ZERO_MAX,
            llr_normalization_lower_bound: LLR_NORMALIZATION_LOWER_BOUND,
            llr_normalization_upper_bound: LLR_NORMALIZATION_UPPER_BOUND,
            fuzzy_hash_sensitivity_factor: FUZZY_HASH_SENSITIVITY_FACTOR,
            fuzzy_hash_min_threshold: FUZZY_HASH_MIN_THRESHOLD,
        }
    }
}
