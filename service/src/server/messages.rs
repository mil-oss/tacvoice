//! Tactical message catalog parsed from msgrepo-delivered messages.xml.
//! Server-side single source of truth handed to the WASM client on request.

use libxml::parser::Parser;
use libxml::tree::{Node, NodeType};
use std::collections::HashMap;
use std::sync::OnceLock;
use tacvoice_client::messages::{
    Detail, Dimension, Line, LineKind, Message, MessageGroup, SelectOption, TableColumn, TableDef,
};

static CATALOG: OnceLock<MessageCatalog> = OnceLock::new();

/// In-memory tactical message catalog with lookup by message number.
/// Parsed once from the embedded XML and shared process-wide.
#[derive(Clone, Default)]
pub struct MessageCatalog {
    pub groups: Vec<MessageGroup>,
    pub by_number: HashMap<String, Message>,
}

impl MessageCatalog {
    /// Parses a tacmsg/messages.xml document string into a catalog.
    /// Skips any non-`Messages` top-level children.
    pub fn from_xml(xml: &str) -> Self {
        let parser = Parser::default();
        let doc = parser
            .parse_string(xml)
            .expect("Failed to parse messages.xml");
        let root = doc
            .get_root_element()
            .expect("messages.xml missing root element");
        let mut groups = Vec::new();
        let mut by_number = HashMap::new();
        for group_node in element_children(&root) {
            if group_node.get_name() != "Messages" {
                continue;
            }
            let group = parse_group(&group_node);
            for msg in &group.messages {
                by_number.insert(msg.number.clone(), msg.clone());
            }
            groups.push(group);
        }
        Self { groups, by_number }
    }

    /// Returns the message form matching the given number, if present.
    pub fn get_message_form(&self, number: &str) -> Option<&Message> {
        self.by_number.get(number)
    }
}

/// Returns the process-wide catalog loaded from msgrepo at startup.
pub fn catalog() -> &'static MessageCatalog {
    CATALOG
        .get()
        .expect("message catalog not loaded from msgrepo")
}

/// Initializes the process-wide catalog from raw messages.xml bytes.
/// Used to seed the catalog from a repository pull; returns false if empty.
pub fn init_catalog_from_bytes(xml: &str) -> bool {
    let parsed = MessageCatalog::from_xml(xml);
    if parsed.by_number.is_empty() {
        return false;
    }
    let count = parsed.by_number.len();
    if CATALOG.set(parsed).is_ok() {
        println!("[messages] loaded {} tactical messages from repository", count);
        true
    } else {
        false
    }
}

/// Returns the element (non-text) child nodes of a node.
fn element_children(node: &Node) -> Vec<Node> {
    node.get_child_nodes()
        .into_iter()
        .filter(|c| c.get_type() == Some(NodeType::ElementNode))
        .collect()
}

/// Reads an attribute value from a node.
fn attr(node: &Node, name: &str) -> Option<String> {
    node.get_attribute(name)
}

/// Builds a MessageGroup from a `Messages` element.
fn parse_group(node: &Node) -> MessageGroup {
    let kind = attr(node, "typeText").unwrap_or_default();
    let color = attr(node, "colorText").unwrap_or_default();
    let hex = attr(node, "hexText").unwrap_or_default();
    let messages = element_children(node)
        .iter()
        .filter(|n| n.get_name() == "Message")
        .map(parse_message)
        .collect();
    MessageGroup {
        kind,
        color,
        hex,
        messages,
    }
}

/// Builds a Message from a `Message` element.
fn parse_message(node: &Node) -> Message {
    let number = attr(node, "numberText").unwrap_or_default();
    let name = attr(node, "nameText").unwrap_or_default();
    let alert = attr(node, "alertText");
    let mut lines = Vec::new();
    let mut remarks = None;
    for child in element_children(node) {
        match child.get_name().as_str() {
            "Line" => lines.push(parse_line(&child)),
            "Input" => {
                remarks = Some(
                    attr(&child, "nameText").unwrap_or_else(|| "Remarks".to_string()),
                )
            }
            _ => {}
        }
    }
    Message {
        number,
        name,
        alert,
        lines,
        remarks,
    }
}

/// Builds a Line and infers its kind from child elements.
fn parse_line(node: &Node) -> Line {
    let id = attr(node, "numberText")
        .or_else(|| attr(node, "letterText"))
        .unwrap_or_default();
    let info = attr(node, "infoText").unwrap_or_default();
    let kind = parse_line_kind(node);
    Line { id, info, kind }
}

/// Determines the LineKind from the element children of a line.
fn parse_line_kind(node: &Node) -> LineKind {
    let children = element_children(node);
    if children.is_empty() {
        return LineKind::Input;
    }
    let has = |name: &str| children.iter().any(|c| c.get_name() == name);

    if has("Dimension") {
        let dims = children
            .iter()
            .filter(|c| c.get_name() == "Dimension")
            .map(parse_dimension)
            .collect();
        return LineKind::Dimensions(dims);
    }
    if has("Table") {
        if let Some(table) = children.iter().find(|c| c.get_name() == "Table") {
            return LineKind::Table(parse_table(table));
        }
    }
    if has("Message") {
        if let Some(sub) = children.iter().find(|c| c.get_name() == "Message") {
            return LineKind::SubMessage(Box::new(parse_message(sub)));
        }
    }
    if has("Detail") {
        let details = children
            .iter()
            .filter(|c| c.get_name() == "Detail")
            .map(parse_detail)
            .collect();
        return LineKind::Details(details);
    }
    if has("Select") {
        let options = children
            .iter()
            .filter(|c| c.get_name() == "Select")
            .map(parse_select)
            .collect();
        return LineKind::Select {
            options,
            remarks: has("Input"),
        };
    }
    LineKind::Input
}

/// Builds a SelectOption from a `Select` element.
fn parse_select(node: &Node) -> SelectOption {
    SelectOption {
        number: attr(node, "numberText").unwrap_or_default(),
        value: attr(node, "valueText").unwrap_or_default(),
        default: attr(node, "defaultIndicator")
            .map(|v| v == "true")
            .unwrap_or(false),
    }
}

/// Builds a Dimension (named group of unit-of-measure codes).
fn parse_dimension(node: &Node) -> Dimension {
    let options = element_children(node)
        .iter()
        .filter(|c| c.get_name() == "Select")
        .map(parse_select)
        .collect();
    Dimension {
        name: attr(node, "nameText").unwrap_or_default(),
        options,
    }
}

/// Builds a Detail from a `Detail` element.
fn parse_detail(node: &Node) -> Detail {
    Detail {
        number: attr(node, "numberText").unwrap_or_default(),
        info: attr(node, "infoText").unwrap_or_default(),
    }
}

/// Builds a TableDef: header columns, labeled rows, and optional row count.
fn parse_table(node: &Node) -> TableDef {
    let mut columns = Vec::new();
    let mut rows = Vec::new();
    let mut row_count = None;
    for child in element_children(node) {
        match child.get_name().as_str() {
            "Row" => {
                let cols: Vec<Node> = element_children(&child)
                    .into_iter()
                    .filter(|c| c.get_name() == "Column")
                    .collect();
                if !cols.is_empty() {
                    for col in &cols {
                        columns.push(TableColumn {
                            name: attr(col, "nameText").unwrap_or_default(),
                            col_type: attr(col, "columnTypeText"),
                        });
                    }
                } else if let Some(name) = attr(&child, "nameText") {
                    rows.push(name);
                }
            }
            "RowCount" => {
                row_count = attr(&child, "defaultNumeric").and_then(|v| v.parse::<u32>().ok());
            }
            _ => {}
        }
    }
    TableDef {
        columns,
        rows,
        row_count,
    }
}
