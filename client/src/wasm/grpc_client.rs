//! Browser-side gRPC-Web client for the TacVoice gateway.
//! Hand-encodes Action/GetMessage protobuf frames and decodes responses.

use crate::logmeta::{RecordingMeta, SubmissionMeta};
use gloo_net::http::Request;
use wasm_bindgen::prelude::*;

/// Fully-qualified gateway service name routed by the gRPC-Web gateway.
const SERVICE: &str = "tacvoice.TacvoiceService";

/// Fully-qualified transcriber service name routed by the gRPC-Web gateway.
const TRANSCRIBER_SERVICE: &str = "transcriber.TranscriberService";

/// Fully-qualified recognizer service name routed by the gRPC-Web gateway.
const RECOGNIZER_SERVICE: &str = "recognizer.RecognizerService";

/// gRPC-Web client targeting the page-origin gateway proxy.
/// Exposes logging actions and tactical message retrieval to JavaScript.
#[wasm_bindgen]
#[derive(Clone)]
pub struct TacVoiceGrpcClient {
    gateway_url: String,
}

impl TacVoiceGrpcClient {
    /// Derives the gateway URL from the current page origin.
    fn page_origin() -> String {
        if let Some(window) = web_sys::window() {
            if let Ok(origin) = window.location().origin() {
                return origin;
            }
        }
        "https://localhost".to_string()
    }

    /// Posts a gRPC-Web framed body and returns the raw response bytes.
    async fn post(&self, url: &str, body: Vec<u8>) -> Result<Vec<u8>, JsValue> {
        let request = Request::post(url)
            .header("Content-Type", "application/grpc-web+proto")
            .header("Accept", "application/grpc-web+proto")
            .header("X-Grpc-Web", "1")
            .header("X-User-Agent", "grpc-web-wasm/0.1")
            .body(body)
            .map_err(|e| JsValue::from_str(&format!("Failed to build request: {}", e)))?;
        let response = request
            .send()
            .await
            .map_err(|e| JsValue::from_str(&format!("Request failed: {}", e)))?;
        if !response.ok() {
            return Err(JsValue::from_str(&format!(
                "HTTP {}: {}",
                response.status(),
                response.status_text()
            )));
        }
        response
            .binary()
            .await
            .map_err(|e| JsValue::from_str(&format!("Failed to read response: {}", e)))
    }

    /// Sends a LogAction request and returns the decoded LogResponse message.
    async fn log_action(&self, action_msg: Vec<u8>) -> Result<String, JsValue> {
        let url = format!("{}/{}/LogAction", self.gateway_url, SERVICE);
        let resp = self.post(&url, grpc_frame(&action_msg)).await?;
        match decode_field1_bytes(&resp) {
            Some(bytes) => Ok(String::from_utf8_lossy(&bytes).to_string()),
            None => Ok(String::new()),
        }
    }
}

#[wasm_bindgen]
impl TacVoiceGrpcClient {
    /// Creates a client using the current page origin as gateway URL.
    #[wasm_bindgen(constructor)]
    pub fn new() -> Self {
        console_error_panic_hook::set_once();
        Self {
            gateway_url: Self::page_origin(),
        }
    }

    /// Logs service startup via Action.start_service.
    #[wasm_bindgen]
    pub async fn log_startup(&self) -> Result<String, JsValue> {
        self.log_action(encode_action_empty(1)).await
    }

    /// Logs a recording carrying operator callsign and transcript byte size.
    #[wasm_bindgen]
    pub async fn log_recording(&self, callsign: String, size: u32) -> Result<String, JsValue> {
        let meta = RecordingMeta {
            callsign,
            size: size as usize,
        };
        let bytes = serde_json::to_vec(&meta)
            .map_err(|e| JsValue::from_str(&format!("Serialize recording meta: {}", e)))?;
        self.log_action(encode_action_with_bytes(2, &bytes)).await
    }

    /// Logs a submission carrying the message identity and radio/chat payloads.
    #[wasm_bindgen]
    pub async fn log_submission(
        &self,
        message_name: String,
        message_number: String,
        radio: String,
        chat: String,
    ) -> Result<String, JsValue> {
        let meta = SubmissionMeta {
            message_name,
            message_number,
            radio,
            chat,
        };
        let bytes = serde_json::to_vec(&meta)
            .map_err(|e| JsValue::from_str(&format!("Serialize submission meta: {}", e)))?;
        self.log_action(encode_action_with_bytes(3, &bytes)).await
    }

    /// Logs service shutdown via Action.stop_service.
    #[wasm_bindgen]
    pub async fn log_shutdown(&self) -> Result<String, JsValue> {
        self.log_action(encode_action_empty(4)).await
    }

    /// Fetches a tactical message form as a JSON string by message number.
    #[wasm_bindgen]
    pub async fn get_message(&self, number: String) -> Result<String, JsValue> {
        let url = format!("{}/{}/GetMessage", self.gateway_url, SERVICE);
        let req = encode_len_delim(1, number.as_bytes());
        let resp = self.post(&url, grpc_frame(&req)).await?;
        let bytes = decode_field1_bytes(&resp)
            .ok_or_else(|| JsValue::from_str("GetMessage: missing message field"))?;
        String::from_utf8(bytes)
            .map_err(|e| JsValue::from_str(&format!("GetMessage: invalid UTF-8: {}", e)))
    }

    /// Publishes a finished transcript to the transcriber service; returns the Orderwire path.
    #[wasm_bindgen]
    pub async fn publish_transcription(&self, transcription: String) -> Result<String, JsValue> {
        let url = format!(
            "{}/{}/PublishTranscription",
            self.gateway_url, TRANSCRIBER_SERVICE
        );
        let req = encode_len_delim(1, transcription.as_bytes());
        let resp = self.post(&url, grpc_frame(&req)).await?;
        let bytes = decode_field1_bytes(&resp)
            .ok_or_else(|| JsValue::from_str("PublishTranscription: missing path field"))?;
        String::from_utf8(bytes)
            .map_err(|e| JsValue::from_str(&format!("PublishTranscription: invalid UTF-8: {}", e)))
    }

    /// Publishes a recognition payload to the recognizer service; returns the Orderwire path.
    #[wasm_bindgen]
    pub async fn publish_recognition(&self, recognition: String) -> Result<String, JsValue> {
        let url = format!(
            "{}/{}/PublishRecognition",
            self.gateway_url, RECOGNIZER_SERVICE
        );
        let req = encode_len_delim(1, recognition.as_bytes());
        let resp = self.post(&url, grpc_frame(&req)).await?;
        let bytes = decode_field1_bytes(&resp)
            .ok_or_else(|| JsValue::from_str("PublishRecognition: missing path field"))?;
        String::from_utf8(bytes)
            .map_err(|e| JsValue::from_str(&format!("PublishRecognition: invalid UTF-8: {}", e)))
    }

    /// Fetches the message catalog as a JSON string for building selection menus.
    #[wasm_bindgen]
    pub async fn get_catalog(&self) -> Result<String, JsValue> {
        let url = format!("{}/{}/GetCatalog", self.gateway_url, SERVICE);
        let resp = self.post(&url, grpc_frame(&[])).await?;
        let bytes = decode_field1_bytes(&resp)
            .ok_or_else(|| JsValue::from_str("GetCatalog: missing catalog field"))?;
        String::from_utf8(bytes)
            .map_err(|e| JsValue::from_str(&format!("GetCatalog: invalid UTF-8: {}", e)))
    }
}

impl Default for TacVoiceGrpcClient {
    fn default() -> Self {
        Self::new()
    }
}

/// Encodes a u64 as a protobuf base-128 varint.
fn encode_varint(mut value: u64, buf: &mut Vec<u8>) {
    loop {
        if value < 0x80 {
            buf.push(value as u8);
            break;
        }
        buf.push(((value & 0x7F) | 0x80) as u8);
        value >>= 7;
    }
}

/// Encodes a length-delimited (wire type 2) field with the given field number.
fn encode_len_delim(field: u8, payload: &[u8]) -> Vec<u8> {
    let mut out = Vec::with_capacity(payload.len() + 2);
    out.push((field << 3) | 2);
    encode_varint(payload.len() as u64, &mut out);
    out.extend_from_slice(payload);
    out
}

/// Encodes an Action containing an empty sub-message at the given oneof field.
fn encode_action_empty(field: u8) -> Vec<u8> {
    encode_len_delim(field, &[])
}

/// Encodes an Action whose sub-message carries `metadata` bytes in field 1.
fn encode_action_with_bytes(field: u8, metadata: &[u8]) -> Vec<u8> {
    let inner = encode_len_delim(1, metadata);
    encode_len_delim(field, &inner)
}

/// Wraps a protobuf message in an uncompressed gRPC-Web frame.
fn grpc_frame(msg: &[u8]) -> Vec<u8> {
    let mut frame = Vec::with_capacity(msg.len() + 5);
    frame.push(0);
    frame.extend_from_slice(&(msg.len() as u32).to_be_bytes());
    frame.extend_from_slice(msg);
    frame
}

/// Extracts the message body from an uncompressed gRPC-Web response frame.
fn grpc_message_body(data: &[u8]) -> Option<&[u8]> {
    if data.len() < 5 || data[0] != 0 {
        return None;
    }
    let len = u32::from_be_bytes([data[1], data[2], data[3], data[4]]) as usize;
    let end = 5 + len;
    if end > data.len() {
        return None;
    }
    Some(&data[5..end])
}

/// Reads a base-128 varint, returning the value and bytes consumed.
fn read_varint(buf: &[u8]) -> Option<(u64, usize)> {
    let mut result: u64 = 0;
    let mut shift = 0;
    let mut pos = 0;
    loop {
        let b = *buf.get(pos)?;
        pos += 1;
        result |= ((b & 0x7F) as u64) << shift;
        if b & 0x80 == 0 {
            return Some((result, pos));
        }
        shift += 7;
        if shift > 63 {
            return None;
        }
    }
}

/// Decodes field 1 (wire type 2) bytes from a gRPC-Web response frame.
fn decode_field1_bytes(frame: &[u8]) -> Option<Vec<u8>> {
    let body = grpc_message_body(frame)?;
    let mut i = 0usize;
    while i < body.len() {
        let tag = *body.get(i)?;
        i += 1;
        let field = tag >> 3;
        let wire = tag & 0x07;
        match wire {
            0 => {
                let (_, adv) = read_varint(&body[i..])?;
                i += adv;
            }
            1 => i += 8,
            2 => {
                let (len, adv) = read_varint(&body[i..])?;
                i += adv;
                let end = i + len as usize;
                if end > body.len() {
                    return None;
                }
                if field == 1 {
                    return Some(body[i..end].to_vec());
                }
                i = end;
            }
            5 => i += 4,
            _ => return None,
        }
    }
    None
}
