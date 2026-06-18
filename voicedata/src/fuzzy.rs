//! Fuzzy hashing implementation for voiceprint comparison using TLSH
use crate::server::error::{Result, VoicelockError};
use crate::voice::structures::GmmParameters;
use rmp_serde::to_vec;

/// Compute fuzzy hash using TLSH (fast-tlsh library)
/// Returns the hash as a UTF-8 encoded byte vector
pub fn compute_fuzzy_hash(gmm: &GmmParameters) -> Result<Vec<u8>> {
    let bytes = to_vec(gmm)
        .map_err(|e| VoicelockError::Serialization(format!("Failed to serialize GMM: {}", e)))?;

    // TLSH requires at least 50 bytes - reject if too small
    if bytes.len() < 50 {
        return Err(VoicelockError::VoicePrint(format!(
            "GMM serialization too small for TLSH: {} bytes (minimum 50 required)",
            bytes.len()
        )));
    }

    // Use tlsh::hash_buf API from fast-tlsh
    let hash = tlsh::hash_buf(&bytes)
        .map_err(|e| VoicelockError::VoicePrint(format!("Failed to compute TLSH: {}", e)))?;

    // Convert to string and then to bytes for storage
    let hash_string = hash.to_string();
    Ok(hash_string.as_bytes().to_vec())
}

/// Compare two TLSH hashes and return similarity score (0-100)
/// TLSH returns distance (0 = identical, higher = different)
/// We convert to similarity score: 100 - (distance / max_distance * 100)
pub fn compare_fuzzy_hashes(hash1: &Vec<u8>, hash2: &Vec<u8>) -> Result<u32> {
    if hash1 == hash2 {
        return Ok(100);
    }

    // Convert bytes back to strings
    let hash1_str = String::from_utf8(hash1.clone()).map_err(|e| {
        VoicelockError::VoicePrint(format!("Failed to convert hash1 to string: {:?}", e))
    })?;
    let hash2_str = String::from_utf8(hash2.clone()).map_err(|e| {
        VoicelockError::VoicePrint(format!("Failed to convert hash2 to string: {:?}", e))
    })?;

    // Use tlsh::compare function which returns distance
    let distance = tlsh::compare(&hash1_str, &hash2_str).map_err(|e| {
        VoicelockError::VoicePrint(format!("Failed to compare TLSH hashes: {:?}", e))
    })?;

    // Convert distance to similarity score (0-100)
    // TLSH max distance is 1216
    const MAX_TLSH_DISTANCE: u32 = 1216;
    let similarity = if distance >= MAX_TLSH_DISTANCE {
        0
    } else {
        100 - ((distance * 100) / MAX_TLSH_DISTANCE)
    };

    Ok(similarity)
}

/// Compare fuzzy hashes with sensitivity adjustment
pub fn compare_fuzzy_hashes_with_sensitivity(
    hash1: &Vec<u8>,
    hash2: &Vec<u8>,
    sensitivity_factor: f32,
    min_threshold: u32,
) -> Result<u32> {
    let raw_score = compare_fuzzy_hashes(hash1, hash2)?;

    // Apply minimum threshold
    if raw_score < min_threshold {
        return Ok(0);
    }

    // Apply sensitivity factor using a power function for non-linear scaling
    let adjusted = if sensitivity_factor != 1.0 {
        let normalized = raw_score as f32 / 100.0;
        let scaled = normalized.powf(1.0 / sensitivity_factor);
        (scaled * 100.0) as u32
    } else {
        raw_score
    };

    Ok(adjusted.min(100))
}

/// Compare two quantized GMM vectors (hex-encoded strings) directly
/// This is for backward compatibility with stored hex-encoded hashes
pub fn compare_quantized_vectors(hex_vec1: &str, hex_vec2: &str) -> Result<u32> {
    // Decode hex strings to byte vectors
    let vec1 = hex::decode(hex_vec1)
        .map_err(|e| VoicelockError::VoicePrint(format!("Failed to decode hex vector 1: {}", e)))?;
    let vec2 = hex::decode(hex_vec2)
        .map_err(|e| VoicelockError::VoicePrint(format!("Failed to decode hex vector 2: {}", e)))?;

    compare_fuzzy_hashes(&vec1, &vec2)
}
