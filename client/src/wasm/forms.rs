//! WASM form rendering and submission for tactical messages.
//! Fetches a message object from the gateway and builds its HTML form.

use crate::logmeta::SubmissionMeta;
use crate::messages::{Line, LineKind, Message};
use crate::wasm::grpc_client::TacVoiceGrpcClient;
use std::fmt::Write as _;
use wasm_bindgen::prelude::*;
use wasm_bindgen::JsCast;
use web_sys::{Document, Element, HtmlInputElement, HtmlSelectElement, HtmlTextAreaElement};

/// Renders a message form from JSON into `#form-root`.
#[wasm_bindgen]
pub fn render_form_json(json: String, hex: String) -> Result<(), JsValue> {
    let message: Message = serde_json::from_str(&json)
        .map_err(|e| JsValue::from_str(&format!("Failed to parse message: {}", e)))?;
    inject_form_html(&message, &hex)
}

/// Fetches the named message form and renders it into `#form-root`.
#[wasm_bindgen]
pub async fn render_message_form(number: String, hex: String) -> Result<(), JsValue> {
    let client = TacVoiceGrpcClient::new();
    let json = client.get_message(number).await?;
    let message: Message = serde_json::from_str(&json)
        .map_err(|e| JsValue::from_str(&format!("Failed to parse message: {}", e)))?;
    inject_form_html(&message, &hex)
}

/// Injects built form HTML into `#form-root`.
fn inject_form_html(message: &Message, hex: &str) -> Result<(), JsValue> {
    let document = document()?;
    let root = document
        .get_element_by_id("form-root")
        .ok_or_else(|| JsValue::from_str("Missing #form-root element"))?;
    root.set_inner_html(&build_form_html(message, hex));
    Ok(())
}

/// Refreshes `#radio-output` and `#chat-output` from the live form state.
#[wasm_bindgen]
pub fn refresh_form_outputs() -> Result<(), JsValue> {
    update_outputs_from_form()
}

/// Serializes the live form to radio/chat text using legacy showData rules.
/// Logs to the server when reachable; always clears the form and returns submission JSON.
#[wasm_bindgen]
pub async fn submit_form() -> Result<String, JsValue> {
    let document = document()?;
    let form = document
        .get_element_by_id("tacvoice-form")
        .ok_or_else(|| JsValue::from_str("No form to submit"))?;
    let name = form.get_attribute("data-name").unwrap_or_default();
    let number = form.get_attribute("data-number").unwrap_or_default();

    let (radio, chat) = update_outputs_from_form_with_form(&document, &form)?;

    let client = TacVoiceGrpcClient::new();
    if let Err(e) = client
        .log_submission(name.clone(), number.clone(), radio.clone(), chat.clone())
        .await
    {
        web_sys::console::warn_1(
            &format!("log_submission failed (form still submitted locally): {:?}", e).into(),
        );
    }

    clear_form_display(&document)?;

    let meta = SubmissionMeta {
        message_name: name,
        message_number: number,
        radio,
        chat,
    };
    serde_json::to_string(&meta)
        .map_err(|e| JsValue::from_str(&format!("Failed to serialize submission: {}", e)))
}

/// Removes the rendered form from `#form-root` while keeping output textareas.
fn clear_form_display(document: &Document) -> Result<(), JsValue> {
    if let Some(root) = document.get_element_by_id("form-root") {
        root.set_inner_html("");
    }
    Ok(())
}

/// Serializes `#tacvoice-form` and writes radio/chat output textareas.
fn update_outputs_from_form() -> Result<(), JsValue> {
    let document = document()?;
    let Some(form) = document.get_element_by_id("tacvoice-form") else {
        return Ok(());
    };
    update_outputs_from_form_with_form(&document, &form)?;
    Ok(())
}

/// Serializes the given form element and updates output textareas.
fn update_outputs_from_form_with_form(
    document: &Document,
    form: &Element,
) -> Result<(String, String), JsValue> {
    let (radio, chat) = serialize_show_data(form)?;
    set_textarea(document, "radio-output", &radio);
    set_textarea(document, "chat-output", &chat);
    Ok((radio, chat))
}

/// Clears the rendered form, the outputs, and the transcript display.
#[wasm_bindgen]
pub fn cancel_form() -> Result<(), JsValue> {
    let document = document()?;
    clear_form_display(&document)?;
    set_textarea(&document, "radio-output", "");
    set_textarea(&document, "chat-output", "");
    if let Some(t) = document.get_element_by_id("transcript") {
        t.set_text_content(Some(""));
    }
    Ok(())
}

/// Returns the active document or a JS error.
fn document() -> Result<Document, JsValue> {
    web_sys::window()
        .ok_or_else(|| JsValue::from_str("No window"))?
        .document()
        .ok_or_else(|| JsValue::from_str("No document"))
}

/// Reads the current value of an input, select, or textarea element.
fn read_value(el: &Element) -> String {
    if let Some(input) = el.dyn_ref::<HtmlInputElement>() {
        return input.value();
    }
    if let Some(select) = el.dyn_ref::<HtmlSelectElement>() {
        return select.value();
    }
    if let Some(area) = el.dyn_ref::<HtmlTextAreaElement>() {
        return area.value();
    }
    String::new()
}

/// Returns the display text of the selected option for a select element.
fn selected_option_text(el: &Element) -> String {
    let Some(select) = el.dyn_ref::<HtmlSelectElement>() else {
        return String::new();
    };
    let idx = select.selected_index();
    if idx < 0 {
        return String::new();
    }
    select
        .item(idx as u32)
        .and_then(|opt| opt.text_content())
        .map(|t| t.trim().to_string())
        .unwrap_or_default()
}

/// Serializes form fields using the legacy tacmsg.js showData() rules.
fn serialize_show_data(form: &Element) -> Result<(String, String), JsValue> {
    let nodes = form.query_selector_all("[data-field-type]")?;
    let mut radio = String::new();
    let mut chat = String::new();

    let first_is_dims = nodes.length() > 0
        && nodes
            .item(0)
            .and_then(|n| n.dyn_into::<Element>().ok())
            .and_then(|el| el.get_attribute("data-dim-name"))
            .as_deref()
            == Some("Length");

    if first_is_dims {
        radio.push_str("A:");
        chat.push_str("Line A: Units of Measure.");
    }

    let mut i = 0u32;
    while i < nodes.length() {
        let Some(node) = nodes.item(i) else {
            i += 1;
            continue;
        };
        let Ok(el) = node.dyn_into::<Element>() else {
            i += 1;
            continue;
        };
        let field_type = el.get_attribute("data-field-type").unwrap_or_default();

        match field_type.as_str() {
            "dimension" => {
                let value = read_value(&el);
                if value_is_positive(&value) {
                    let dim_name = el.get_attribute("data-dim-name").unwrap_or_default();
                    let _ = write!(radio, " {}", value.trim());
                    let display = selected_option_text(&el);
                    let _ = write!(chat, "\n{}:{}", dim_name, display);
                }
            }
            "select" => {
                let select_value = read_value(&el);
                if !select_value.is_empty() {
                    let radio_name = el.get_attribute("data-radio-name").unwrap_or_default();
                    let line_label = el.get_attribute("data-line-label").unwrap_or_default();
                    let display = selected_option_text(&el);

                    let mut remarks = String::new();
                    if i + 1 < nodes.length() {
                        if let Some(next) = nodes.item(i + 1) {
                            if let Ok(next_el) = next.dyn_into::<Element>() {
                                if next_el.get_attribute("data-field-type").as_deref()
                                    == Some("select-remarks")
                                {
                                    remarks = read_value(&next_el);
                                    i += 1;
                                }
                            }
                        }
                    }

                    let _ = write!(radio, "\n{}:{}", radio_name, select_value);
                    if !remarks.is_empty() {
                        radio.push(' ');
                        radio.push_str(&remarks);
                    }

                    let _ = write!(chat, "\n{}({})-{}", line_label, select_value, display);
                    if !remarks.is_empty() {
                        chat.push(' ');
                        chat.push_str(&remarks);
                    }
                }
            }
            "select-remarks" => {}
            "input" => {
                let value = read_value(&el);
                if !value.is_empty() {
                    let radio_name = el.get_attribute("data-radio-name").unwrap_or_default();
                    let line_label = el.get_attribute("data-line-label").unwrap_or_default();
                    let _ = write!(radio, "\n{}:{}", radio_name, value);
                    let _ = write!(chat, "\n{}: {}", line_label, value);
                }
            }
            _ => {}
        }
        i += 1;
    }

    Ok((radio, chat))
}

/// Returns true when a numeric field value is greater than zero.
fn value_is_positive(value: &str) -> bool {
    value
        .trim()
        .parse::<f64>()
        .map(|n| n > 0.0)
        .unwrap_or(false)
}

/// Sets the value of a textarea by id, ignoring missing elements.
fn set_textarea(document: &Document, id: &str, value: &str) {
    if let Some(el) = document.get_element_by_id(id) {
        if let Some(area) = el.dyn_ref::<HtmlTextAreaElement>() {
            area.set_value(value);
        }
    }
}

/// Builds the complete HTML for a message form.
fn build_form_html(message: &Message, hex: &str) -> String {
    let bg = if hex.is_empty() { "transparent".to_string() } else { hex.to_string() };
    let mut html = String::new();
    let _ = write!(
        html,
        "<form id=\"tacvoice-form\" class=\"msg\" data-number=\"{}\" data-name=\"{}\" \
         style=\"background-color: {}\">",
        escape(&message.number),
        escape(&message.name),
        escape(&bg)
    );
    let _ = write!(
        html,
        "<h2>{}: {}</h2><div>",
        escape(&message.number),
        escape(&message.name)
    );
    if let Some(alert) = &message.alert {
        let _ = write!(html, "<p class=\"alert\">{}</p>", escape(alert));
    }
    for line in &message.lines {
        build_line_html(line, "", &mut html);
    }
    if let Some(remarks) = &message.remarks {
        let _ = write!(
            html,
            "<div class=\"tspace\"><div><b>{}</b></div>\
             <input type=\"text\" name=\"{}\" data-field-type=\"input\" data-radio-name=\"{}\" \
             data-line-label=\"{}\" data-line=\"remarks\"></div>",
            escape(remarks),
            escape(remarks),
            escape(remarks),
            escape(remarks)
        );
    }
    html.push_str("</div></form>");
    html
}

/// Returns the legacy LINE label text for a line.
fn line_label_text(line: &Line) -> String {
    format!("LINE {}: {}", line.id, line.info)
}

/// Appends the HTML for a single line, dispatching on its kind.
fn build_line_html(line: &Line, prefix: &str, html: &mut String) {
    let id = format!("{}{}", prefix, line.id);
    let line_label = line_label_text(line);
    let b_label = format!("<b>{}</b>", escape(&line_label));

    match &line.kind {
        LineKind::Input => {
            let _ = write!(
                html,
                "<div class=\"tspace\"><div>{}</div>\
                 <input type=\"text\" name=\"{}\" data-field-type=\"input\" data-radio-name=\"{}\" \
                 data-line-label=\"{}\" data-line=\"{}\"></div>",
                b_label,
                escape(&id),
                escape(&id),
                escape(&line_label),
                escape(&id)
            );
        }
        LineKind::Select { options, .. } => {
            let select_name = format!("{}select", id);
            let _ = write!(
                html,
                "<div class=\"tspace\">{}<br><select name=\"{}\" data-field-type=\"select\" \
                 data-radio-name=\"{}\" data-line-label=\"{}\" data-line=\"{}\">",
                b_label,
                escape(&select_name),
                escape(&id),
                escape(&line_label),
                escape(&id)
            );
            for opt in options {
                let opt_val = if !opt.number.is_empty() {
                    &opt.number
                } else {
                    &opt.value
                };
                let selected = if opt.default { " selected" } else { "" };
                let _ = write!(
                    html,
                    "<option value=\"{}\"{}> {} </option>",
                    escape(opt_val),
                    selected,
                    escape(&opt.value)
                );
            }
            let _ = write!(
                html,
                "</select><br><i> Remarks:</i><br>\
                 <input type=\"text\" name=\"{}\" data-field-type=\"select-remarks\" \
                 data-radio-name=\"{}\" data-line-label=\"{}\" data-line=\"{}-remarks\"></div>",
                escape(&id),
                escape(&id),
                escape(&line_label),
                escape(&id)
            );
        }
        LineKind::Dimensions(dims) => {
            let _ = write!(
                html,
                "<div class=\"tspace dim-block\"><div>{}</div><div class=\"dim-row\">",
                b_label
            );
            for dim in dims {
                let _ = write!(
                    html,
                    "<span class=\"dim\"><label>{}</label><select name=\"{}\" \
                     data-field-type=\"dimension\" data-dim-name=\"{}\" data-line=\"{}-{}\">",
                    escape(&dim.name),
                    escape(&dim.name),
                    escape(&dim.name),
                    escape(&id),
                    escape(&dim.name)
                );
                for opt in &dim.options {
                    let selected = if opt.default { " selected" } else { "" };
                    let _ = write!(
                        html,
                        "<option value=\"{}\"{}> {} </option>",
                        escape(&opt.number),
                        selected,
                        escape(&opt.value)
                    );
                }
                html.push_str("</select></span>");
            }
            html.push_str("</div></div>");
        }
        LineKind::Table(table) => {
            let _ = write!(
                html,
                "<div class=\"tspace\"><div>{}</div><div class=\"table-scroll\"><table>",
                b_label
            );
            html.push_str("<tr><th></th>");
            for col in &table.columns {
                let _ = write!(html, "<th>{}</th>", escape(&col.name));
            }
            html.push_str("</tr>");
            for row in &table.rows {
                let _ = write!(html, "<tr><td>{}</td>", escape(row));
                for col in &table.columns {
                    let cell_class = table_cell_class(col.col_type.as_deref());
                    let _ = write!(
                        html,
                        "<td><input type=\"text\" class=\"{}\" data-field-type=\"input\" \
                         data-radio-name=\"{}\" data-line-label=\"{}\" data-line=\"{}-{}-{}\"></td>",
                        cell_class,
                        escape(row),
                        escape(&line_label),
                        escape(&id),
                        escape(row),
                        escape(&col.name)
                    );
                }
                html.push_str("</tr>");
            }
            if let Some(count) = table.row_count {
                for r in 0..count {
                    html.push_str("<tr><td></td>");
                    for col in &table.columns {
                        let cell_class = table_cell_class(col.col_type.as_deref());
                        let row_name = format!("r{}", r);
                        let _ = write!(
                            html,
                            "<td><input type=\"text\" class=\"{}\" data-field-type=\"input\" \
                             data-radio-name=\"{}\" data-line-label=\"{}\" data-line=\"{}-{}-{}\"></td>",
                            cell_class,
                            row_name,
                            escape(&line_label),
                            escape(&id),
                            row_name,
                            escape(&col.name)
                        );
                    }
                    html.push_str("</tr>");
                }
            }
            html.push_str("</table></div></div>");
        }
        LineKind::SubMessage(sub) => {
            let _ = write!(
                html,
                "<fieldset class=\"submessage\"><legend>{} ({})</legend>",
                escape(&line_label),
                escape(&sub.name)
            );
            let sub_prefix = format!("{}.", id);
            for sub_line in &sub.lines {
                build_line_html(sub_line, &sub_prefix, html);
            }
            if let Some(remarks) = &sub.remarks {
                let sub_label = format!("LINE {}: {}", remarks, remarks);
                let _ = write!(
                    html,
                    "<div class=\"tspace\"><div><b>{}</b></div>\
                     <input type=\"text\" name=\"{}\" data-field-type=\"input\" data-radio-name=\"{}\" \
                     data-line-label=\"{}\" data-line=\"{}remarks\"></div>",
                    escape(&sub_label),
                    escape(remarks),
                    escape(remarks),
                    escape(&sub_label),
                    escape(&sub_prefix)
                );
            }
            html.push_str("</fieldset>");
        }
        LineKind::Details(details) => {
            let _ = write!(html, "<div class=\"tspace\"><div>{}</div>", b_label);
            for detail in details {
                let detail_label = format!("{} {}", detail.number, detail.info);
                let detail_id = format!("{}-{}", id, detail.number);
                let _ = write!(
                    html,
                    "<div class=\"detail\"><label>{}</label>\
                     <input type=\"text\" name=\"{}\" data-field-type=\"input\" data-radio-name=\"{}\" \
                     data-line-label=\"{}\" data-line=\"{}\"></div>",
                    escape(&detail_label),
                    escape(&detail_id),
                    escape(&detail.number),
                    escape(&line_label),
                    escape(&detail_id)
                );
            }
            html.push_str("</div>");
        }
    }
}

/// Maps a table column type to a tacnet.css input width class.
fn table_cell_class(col_type: Option<&str>) -> &'static str {
    match col_type.unwrap_or("").trim() {
        "smcell" => "smcell",
        "mcell" => "mcell",
        "lgcell" => "lgcell",
        "xlcell" => "xlcell",
        "text" => "mcell",
        _ => "mcell",
    }
}

/// Escapes characters that are unsafe inside HTML text or attributes.
fn escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn build_form_includes_hex_and_field_types() {
        let message = Message {
            number: "BLUE 1".to_string(),
            name: "SITREP".to_string(),
            alert: None,
            lines: vec![Line {
                id: "1".to_string(),
                info: "Unit Sending Report".to_string(),
                kind: LineKind::Input,
            }],
            remarks: None,
        };
        let html = build_form_html(&message, "#9999ff");
        assert!(html.contains("background-color: #9999ff"));
        assert!(html.contains("id=\"tacvoice-form\""));
        assert!(html.contains("data-field-type=\"input\""));
        assert!(html.contains("class=\"tspace\""));
    }
}
