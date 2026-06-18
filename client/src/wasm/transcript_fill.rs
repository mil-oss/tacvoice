//! Applies parsed transcript segments to the live tactical message form.

use crate::transcript_parse::{
    parse_transcript_segments_for_lines, segment_data_line, TranscriptSegment,
};
use std::collections::HashSet;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::{Document, Element, HtmlInputElement, HtmlSelectElement, HtmlTextAreaElement};

/// Fills `#tacvoice-form` fields from spoken line markers in the transcript.
#[wasm_bindgen]
pub fn apply_transcript_to_form(text: String) -> Result<u32, JsValue> {
    let document = document()?;
    let Some(form) = document.get_element_by_id("tacvoice-form") else {
        return Ok(0);
    };
    let known_line_ids = collect_line_ids(&form)?;
    let segments = parse_transcript_segments_for_lines(&text, &known_line_ids);
    let mut filled = 0u32;
    for segment in segments {
        if apply_segment(&form, &segment)? {
            filled += 1;
        }
    }
    Ok(filled)
}

fn collect_line_ids(form: &Element) -> Result<HashSet<String>, JsValue> {
    let mut ids = HashSet::new();
    let nodes = form.query_selector_all("[data-field-type=\"input\"], [data-field-type=\"select\"]")?;
    for idx in 0..nodes.length() {
        let Some(node) = nodes.item(idx) else {
            continue;
        };
        let Ok(el) = node.dyn_into::<Element>() else {
            continue;
        };
        if let Some(line) = el.get_attribute("data-line") {
            if !line.is_empty() && !line.ends_with("-remarks") {
                ids.insert(line);
            }
        }
        if let Some(name) = el.get_attribute("data-radio-name") {
            if !name.is_empty() {
                ids.insert(name);
            }
        }
    }
    if let Some(remarks) = form.query_selector("[data-line=\"remarks\"]")? {
        if remarks.get_attribute("data-field-type").as_deref() == Some("input") {
            ids.insert("remarks".to_string());
        }
    }
    Ok(ids)
}

fn apply_segment(form: &Element, segment: &TranscriptSegment) -> Result<bool, JsValue> {
    let data_line = segment_data_line(segment);
    if data_line.is_empty() || segment.content.is_empty() {
        return Ok(false);
    }

    let escaped = escape_css_attr(&data_line);
    let selector = format!(
        "[data-line=\"{escaped}\"], [data-radio-name=\"{escaped}\"][data-field-type=\"input\"], \
         [data-radio-name=\"{escaped}\"][data-field-type=\"select\"], \
         [data-radio-name=\"{escaped}\"][data-field-type=\"select-remarks\"]"
    );
    let nodes = form.query_selector_all(&selector)?;
    let mut applied = false;
    for idx in 0..nodes.length() {
        let Some(node) = nodes.item(idx) else {
            continue;
        };
        let Ok(el) = node.dyn_into::<Element>() else {
            continue;
        };
        if apply_value(&el, &segment.content)? {
            applied = true;
        }
    }
    Ok(applied)
}

fn apply_value(el: &Element, content: &str) -> Result<bool, JsValue> {
    let field_type = el.get_attribute("data-field-type").unwrap_or_default();
    match field_type.as_str() {
        "input" | "select-remarks" => set_input_value(el, content),
        "select" => set_select_value(el, content),
        _ => Ok(false),
    }
}

fn set_input_value(el: &Element, content: &str) -> Result<bool, JsValue> {
    if let Some(input) = el.dyn_ref::<HtmlInputElement>() {
        input.set_value(content);
        return Ok(true);
    }
    if let Some(area) = el.dyn_ref::<HtmlTextAreaElement>() {
        area.set_value(content);
        return Ok(true);
    }
    Ok(false)
}

fn set_select_value(el: &Element, content: &str) -> Result<bool, JsValue> {
    let Some(select) = el.dyn_ref::<HtmlSelectElement>() else {
        return Ok(false);
    };
    let content = content.trim();
    if content.is_empty() {
        return Ok(false);
    }

    if set_select_by_value(select, content) {
        return Ok(true);
    }
    if let Some(number) = leading_token(content) {
        if set_select_by_value(select, &number) {
            return Ok(true);
        }
    }
    if set_select_by_label(select, content) {
        return Ok(true);
    }
    Ok(false)
}

fn set_select_by_value(select: &HtmlSelectElement, value: &str) -> bool {
    for idx in 0..select.length() {
        if let Some(opt) = select.item(idx) {
            let opt_value = opt.get_attribute("value").unwrap_or_default();
            if opt_value == value {
                select.set_selected_index(idx as i32);
                return true;
            }
        }
    }
    false
}

fn set_select_by_label(select: &HtmlSelectElement, content: &str) -> bool {
    let needle = content.to_lowercase();
    for idx in 0..select.length() {
        if let Some(opt) = select.item(idx) {
            let label = opt.text_content().unwrap_or_default().to_lowercase();
            if label.contains(&needle) || needle.contains(label.trim()) {
                select.set_selected_index(idx as i32);
                return true;
            }
        }
    }
    false
}

fn leading_token(content: &str) -> Option<String> {
    content.split_whitespace().next().map(str::to_string)
}

fn escape_css_attr(value: &str) -> String {
    value.replace('\\', "\\\\").replace('"', "\\\"")
}

fn document() -> Result<Document, JsValue> {
    web_sys::window()
        .ok_or_else(|| JsValue::from_str("No window"))?
        .document()
        .ok_or_else(|| JsValue::from_str("No document"))
}
