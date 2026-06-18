use std::error::Error as StdError;
use std::fmt;
use std::time::SystemTimeError;

#[derive(Debug)]
pub enum TacVoiceError {
    ConfigurationError(String),
    ServiceConnectionError(String),
    PolicyError(String),
    ZtServiceError(String),
    Io(std::io::Error),
}

impl fmt::Display for TacVoiceError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            TacVoiceError::ConfigurationError(msg) => write!(f, "Configuration error: {}", msg),
            TacVoiceError::ServiceConnectionError(msg) => {
                write!(f, "Service connection error: {}", msg)
            }
            TacVoiceError::PolicyError(msg) => write!(f, "Policy error: {}", msg),
            TacVoiceError::ZtServiceError(msg) => write!(f, "Zero Trust Service error: {}", msg),
            TacVoiceError::Io(err) => write!(f, "IO error: {}", err),
        }
    }
}

impl StdError for TacVoiceError {
    fn source(&self) -> Option<&(dyn StdError + 'static)> {
        match self {
            TacVoiceError::Io(err) => Some(err),
            _ => None,
        }
    }
}

impl From<std::io::Error> for TacVoiceError {
    fn from(err: std::io::Error) -> Self {
        TacVoiceError::Io(err)
    }
}

impl From<SystemTimeError> for TacVoiceError {
    fn from(err: SystemTimeError) -> Self {
        TacVoiceError::ZtServiceError(format!("System time error: {}", err))
    }
}

impl From<Box<dyn StdError>> for TacVoiceError {
    fn from(err: Box<dyn StdError>) -> Self {
        TacVoiceError::ZtServiceError(format!("Boxed error: {}", err))
    }
}

pub type Result<T> = std::result::Result<T, TacVoiceError>;
