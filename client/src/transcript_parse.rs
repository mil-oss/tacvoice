//! Parses voice transcripts into tactical message line segments.
//! Recognizes spoken line numbers, NATO letters, and remarks markers.

use std::collections::HashSet;

/// A single line's spoken content extracted from a transcript.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct TranscriptSegment {
    pub line_id: String,
    pub is_remarks: bool,
    pub content: String,
}

const COLORS: &[&str] = &["blue", "red", "green", "yellow", "white", "gray", "grey"];

const LINE_MARKERS: &[&str] = &["line", "lines", "lyn", "lain", "lime", "line's"];

const FILLER: &[&str] = &[
    "this", "is", "over", "out", "break", "roger", "copy", "send", "sending", "report",
    "message", "form", "fill", "the",
];

const NUMBER_WORDS: &[(&str, &str)] = &[
    ("zero", "0"),
    ("one", "1"),
    ("two", "2"),
    ("three", "3"),
    ("four", "4"),
    ("five", "5"),
    ("six", "6"),
    ("seven", "7"),
    ("eight", "8"),
    ("nine", "9"),
    ("ten", "10"),
    ("eleven", "11"),
    ("twelve", "12"),
    ("thirteen", "13"),
    ("fourteen", "14"),
    ("fifteen", "15"),
    ("sixteen", "16"),
];

const LETTER_WORDS: &[(&str, &str)] = &[
    ("alpha", "A"),
    ("bravo", "B"),
    ("charlie", "C"),
    ("delta", "D"),
    ("echo", "E"),
    ("foxtrot", "F"),
    ("golf", "G"),
    ("hotel", "H"),
    ("india", "I"),
    ("juliet", "J"),
    ("kilo", "K"),
    ("lima", "L"),
    ("mike", "M"),
    ("november", "N"),
    ("oscar", "O"),
    ("papa", "P"),
    ("quebec", "Q"),
    ("romeo", "R"),
    ("sierra", "S"),
    ("tango", "T"),
    ("uniform", "U"),
    ("victor", "V"),
    ("whiskey", "W"),
    ("xray", "X"),
    ("yankee", "Y"),
    ("zulu", "Z"),
];

/// Splits a transcript into line segments keyed by spoken line identifiers.
pub fn parse_transcript_segments(text: &str) -> Vec<TranscriptSegment> {
    parse_transcript_segments_for_lines(text, &HashSet::new())
}

/// Splits a transcript into segments, preferring ids present on the active form.
pub fn parse_transcript_segments_for_lines(
    text: &str,
    known_line_ids: &HashSet<String>,
) -> Vec<TranscriptSegment> {
    let tokens = strip_message_prefix(tokenize(text));
    if tokens.is_empty() {
        return Vec::new();
    }

    let mut segments = Vec::new();
    let mut idx = 0usize;
    while idx < tokens.len() {
        if is_line_marker(&tokens[idx]) {
            idx += 1;
            let Some((line_id, is_remarks, next_idx)) =
                parse_line_marker(&tokens, idx, known_line_ids)
            else {
                continue;
            };
            idx = next_idx;
            let content_end = find_content_end(&tokens, idx, ContentBoundary::AfterLineMarker, known_line_ids);
            let content = tokens[idx..content_end].join(" ").trim().to_string();
            if !line_id.is_empty() && !content.is_empty() {
                segments.push(TranscriptSegment {
                    line_id,
                    is_remarks,
                    content,
                });
            }
            idx = content_end;
            continue;
        }

        let Some((line_id, is_remarks, next_idx)) =
            parse_line_marker(&tokens, idx, known_line_ids)
        else {
            idx += 1;
            continue;
        };
        if known_line_ids.is_empty() {
            idx += 1;
            continue;
        }
        idx = next_idx;
        let content_end = find_content_end(&tokens, idx, ContentBoundary::BareLineId, known_line_ids);
        let content = tokens[idx..content_end].join(" ").trim().to_string();
        if !line_id.is_empty() && !content.is_empty() {
            segments.push(TranscriptSegment {
                line_id,
                is_remarks,
                content,
            });
        }
        idx = content_end;
    }
    segments
}

/// Returns the `data-line` attribute value for a parsed segment.
pub fn segment_data_line(segment: &TranscriptSegment) -> String {
    if segment.line_id.eq_ignore_ascii_case("remarks") {
        "remarks".to_string()
    } else if segment.is_remarks {
        format!("{}-remarks", segment.line_id)
    } else {
        segment.line_id.clone()
    }
}

fn tokenize(text: &str) -> Vec<String> {
    text.to_lowercase()
        .chars()
        .map(|c| {
            if c.is_ascii_alphanumeric() {
                c
            } else {
                ' '
            }
        })
        .collect::<String>()
        .split_whitespace()
        .map(str::to_string)
        .collect()
}

fn strip_message_prefix(tokens: Vec<String>) -> Vec<String> {
    let mut tokens = tokens;
    while tokens.first().is_some_and(|t| FILLER.contains(&t.as_str())) {
        tokens.remove(0);
    }
    if tokens.len() >= 2 {
        let color = if tokens[0] == "grey" {
            "gray"
        } else {
            tokens[0].as_str()
        };
        if COLORS.contains(&color) && resolve_number(&tokens[1]).is_some() {
            tokens.drain(0..2);
        }
    }
    while tokens.first().is_some_and(|t| FILLER.contains(&t.as_str())) {
        tokens.remove(0);
    }
    tokens
}

fn is_line_marker(token: &str) -> bool {
    LINE_MARKERS.contains(&token)
}

fn parse_line_marker(
    tokens: &[String],
    idx: usize,
    known_line_ids: &HashSet<String>,
) -> Option<(String, bool, usize)> {
    if idx >= tokens.len() {
        return None;
    }

    if tokens[idx] == "remarks" {
        return Some(("remarks".to_string(), false, idx + 1));
    }

    let line_id = resolve_line_id(&tokens[idx])?;
    if !known_line_ids.is_empty() && !line_id_allowed(&line_id, known_line_ids) {
        return None;
    }

    let mut next = idx + 1;
    let is_remarks = next < tokens.len() && tokens[next] == "remarks";
    if is_remarks {
        next += 1;
    }
    Some((line_id, is_remarks, next))
}

fn line_id_allowed(line_id: &str, known_line_ids: &HashSet<String>) -> bool {
    if known_line_ids.contains(line_id) {
        return true;
    }
    known_line_ids.iter().any(|known| {
        known == line_id
            || known.starts_with(&format!("{line_id}-"))
            || known.starts_with(&format!("{line_id}."))
    })
}

enum ContentBoundary {
    AfterLineMarker,
    BareLineId,
}

fn find_content_end(
    tokens: &[String],
    from: usize,
    boundary: ContentBoundary,
    known_line_ids: &HashSet<String>,
) -> usize {
    let mut idx = from;
    while idx < tokens.len() {
        if is_line_marker(&tokens[idx]) {
            return idx;
        }
        if matches!(boundary, ContentBoundary::BareLineId) {
            if let Some(next_id) = resolve_line_id(&tokens[idx]) {
                if line_id_allowed(&next_id, known_line_ids) {
                    return idx;
                }
            }
        }
        idx += 1;
    }
    tokens.len()
}

fn resolve_number(token: &str) -> Option<String> {
    if token.chars().all(|c| c.is_ascii_digit()) {
        return Some(token.to_string());
    }
    NUMBER_WORDS
        .iter()
        .find(|(word, _)| *word == token)
        .map(|(_, id)| (*id).to_string())
}

fn resolve_line_id(token: &str) -> Option<String> {
    if token.chars().all(|c| c.is_ascii_digit()) {
        return Some(token.to_string());
    }
    if token.len() == 1 && token.chars().all(|c| c.is_ascii_alphabetic()) {
        return Some(token.to_uppercase());
    }
    for (word, id) in NUMBER_WORDS {
        if token == *word {
            return Some((*id).to_string());
        }
    }
    for (word, id) in LETTER_WORDS {
        if token == *word {
            return Some((*id).to_string());
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ids(values: &[&str]) -> HashSet<String> {
        values.iter().map(|v| (*v).to_string()).collect()
    }

    #[test]
    fn parses_line_keyword_format() {
        let text = "blue one line one alpha company line two 151430 zulu line bravo grid 1234";
        let segments = parse_transcript_segments(text);
        assert_eq!(
            segments,
            vec![
                TranscriptSegment {
                    line_id: "1".to_string(),
                    is_remarks: false,
                    content: "alpha company".to_string(),
                },
                TranscriptSegment {
                    line_id: "2".to_string(),
                    is_remarks: false,
                    content: "151430 zulu".to_string(),
                },
                TranscriptSegment {
                    line_id: "B".to_string(),
                    is_remarks: false,
                    content: "grid 1234".to_string(),
                },
            ]
        );
    }

    #[test]
    fn parses_bare_line_ids_with_form_hints() {
        let text = "blue one one alpha company two 151430 zulu seven none";
        let known = ids(&["1", "2", "3", "4", "5", "6", "7", "remarks"]);
        let segments = parse_transcript_segments_for_lines(text, &known);
        assert_eq!(
            segments,
            vec![
                TranscriptSegment {
                    line_id: "1".to_string(),
                    is_remarks: false,
                    content: "alpha company".to_string(),
                },
                TranscriptSegment {
                    line_id: "2".to_string(),
                    is_remarks: false,
                    content: "151430 zulu".to_string(),
                },
                TranscriptSegment {
                    line_id: "7".to_string(),
                    is_remarks: false,
                    content: "none".to_string(),
                },
            ]
        );
    }

    #[test]
    fn parses_line_homophones_and_remarks() {
        let text = "lyn one alpha company line three remarks two tanks line remarks end";
        let segments = parse_transcript_segments(text);
        assert_eq!(
            segments,
            vec![
                TranscriptSegment {
                    line_id: "1".to_string(),
                    is_remarks: false,
                    content: "alpha company".to_string(),
                },
                TranscriptSegment {
                    line_id: "3".to_string(),
                    is_remarks: true,
                    content: "two tanks".to_string(),
                },
                TranscriptSegment {
                    line_id: "remarks".to_string(),
                    is_remarks: false,
                    content: "end".to_string(),
                },
            ]
        );
    }

    #[test]
    fn ignores_unknown_bare_ids_without_hints() {
        let text = "alpha company bravo grid";
        let segments = parse_transcript_segments(text);
        assert!(segments.is_empty());
    }
}
