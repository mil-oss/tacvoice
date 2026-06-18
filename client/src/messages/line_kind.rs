use crate::messages::detail::Detail;
use crate::messages::dimension::Dimension;
use crate::messages::message::Message;
use crate::messages::select_option::SelectOption;
use crate::messages::table_def::TableDef;
use serde::{Deserialize, Serialize};

/// The structured content of a line.
/// Determines how the line is rendered and read back.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum LineKind {
    Input,
    Select {
        options: Vec<SelectOption>,
        remarks: bool,
    },
    Dimensions(Vec<Dimension>),
    Table(TableDef),
    SubMessage(Box<Message>),
    Details(Vec<Detail>),
}
