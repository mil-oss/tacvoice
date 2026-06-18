pub const APP: &str = "TacVoiceService";
// POLICIES
pub const POLICY_FILE: &str = "xml/inst/tacvoice/tacvoice_policy.xml";
pub const TACVOICE_POLICY_ID: &str = "tacvoice_policy";
// DEVICES
pub const FACTORY_SERVER_ROUTER: &str = "FactoryServerRouter";
pub const FACTORY_CLIENT_SERVER: &str = "FactoryClientServer";
pub const KEY_SERVER: &str = "KeyServer";
pub const POLICY_SERVER: &str = "PolicyServer";
pub const FILE_SERVER: &str = "FileServer";
pub const LEDGER_SERVER: &str = "LedgerServer";
pub const ORDERWIRE_SERVER: &str = "OrderwireServer";
pub const REPOSITORY_SERVER: &str = "RepositoryServer";
pub const OVERSIGHT_SERVER: &str = "OversightServer";
pub const TACVOICE_SERVER: &str = "TacVoiceServer";
// SERVICES
pub const TACVOICE_WEB_SERVICE: &str = "TacVoiceWebService";
pub const TACVOICE_SERVICE: &str = "TacVoiceService";
pub const TACVOICE_CLIENT: &str = "TacVoiceClientService";

pub const GATEWAY_SERVICE: &str = "GatewayService";
pub const GATEWAY_FILE_CLIENT: &str = "GatewayFileClientService";
pub const GATEWAY_LEDGER_CLIENT: &str = "GatewayLedgerClientService";
pub const GATEWAY_KEY_CLIENT: &str = "GatewayKeyClientService";
pub const GATEWAY_ORDERWIRE_CLIENT: &str = "GatewayOrderwireClientService";

pub const KEY_SERVICE: &str = "KeyService";
pub const KEY_CLIENT: &str = "KeyClientService";
pub const TACVOICE_KEY_CLIENT: &str = "TacVoiceClientService";
pub const POLICY_SERVICE: &str = "PolicyService";
pub const POLICY_CLIENT: &str = "PolicyClientService";
pub const TACVOICE_POLICY_CLIENT: &str = "TacVoiceClientService";
pub const FILE_SERVICE: &str = "FileService";
pub const FILE_CLIENT: &str = "FileClientService";
pub const TACVOICE_FILE_CLIENT: &str = "TacVoiceClientService";
pub const LEDGER_SERVICE: &str = "LedgerService";
pub const LEDGER_CLIENT: &str = "LedgerClientService";
pub const TACVOICE_LEDGER_CLIENT: &str = "TacVoiceClientService";
pub const MESSAGE_REPOSITORY_SERVICE: &str = "MessageRepositoryService";
pub const MESSAGE_REPOSITORY_CLIENT: &str = "MessageRepositoryClientService";
pub const MESSAGE_REPOSITORY_FILE_CLIENT: &str = "MessageRepositoryFileClientService";
pub const MESSAGE_REPOSITORY_NAME: &str = "messages";
pub const MESSAGE_REPOSITORY_LOCATION: &str = "/home/ztxs/repository";
pub const VOICE_REPOSITORY_SERVICE: &str = "VoiceRepositoryService";
pub const VOICE_REPOSITORY_CLIENT: &str = "VoiceRepositoryClientService";
pub const VOICE_REPOSITORY_FILE_CLIENT: &str = "VoiceRepositoryFileClientService";
pub const VOICE_REPOSITORY_NAME: &str = "voice";
pub const VOICE_REPOSITORY_LOCATION: &str = "/home/ztxs/repository";
pub const TACVOICE_REPOSITORY_CLIENT: &str = "TacVoiceClientService";
pub const ORDERWIRE_SERVICE: &str = "OrderwireService";
pub const ORDERWIRE_CLIENT: &str = "OrderwireClientService";
pub const RECEIVER_ORDERWIRE_CLIENT: &str = "ReceiverOrderwireClientService";
pub const TACVOICE_ORDERWIRE_CLIENT: &str = "TacVoiceClientService";
pub const VOSK_WEB_PATH: &str = "vosk/vosk-model.tar.gz";
pub const TRANSCRIBER_SERVICE: &str = "TranscriberService";
pub const TRANSCRIBER_CLIENT: &str = "TranscriberClientService";
pub const RECOGNIZER_SERVICE: &str = "RecognizerService";
pub const RECOGNIZER_CLIENT: &str = "RecognizerClientService";
pub const TRANSCRIPTION_PATH: &str = "tacvoice/transcriptions";
pub const RECOGNITION_PATH: &str = "tacvoice/recognitions";
pub const MESSAGES_RESOURCE: &str = "messages.xml";
pub const VOSK_RESOURCE: &str = "vosk-model.tar.gz";
pub const UBM_RESOURCE: &str = "ubm.bin";
pub const OVERSIGHT_SERVICE: &str = "OversightService";
pub const OVERSIGHT_CLIENT: &str = "OversightClientService";
pub const FACTORY_SERVICE: &str = "FactoryService";
pub const FACTORY_CLIENT: &str = "FactoryClientService";
pub const TACVOICE_FACTORY_CLIENT: &str = "TacVoiceClientService";

pub const DEPLOYER_SERVICE: &str = "DeployerService";
pub const DEPLOYER_CLIENT: &str = "DeployerClientService";
pub const DEPLOYER_KEY_CLIENT: &str = "DeployerKeyClientService";
pub const DEPLOYER_FILE_CLIENT: &str = "DeployerFileClientService";
pub const DEPLOYER_ORDERWIRE_CLIENT: &str = "DeployerOrderwireClientService";

pub const TACVOICE_STATS_PATH: &str = "tacvoice/stats";

pub const LEDGER_LOCATION: &str = "/home/ztxs/ledger";

// Edge serving: when set to "1"/"true" the web edge serves plain HTTP (Istio TLS).
pub const EDGE_PLAINTEXT_ENV: &str = "TACVOICE_EDGE_PLAINTEXT";
// OIDC: Keycloak issuer, JWKS endpoint, and expected audience (client id).
pub const OIDC_ISSUER_ENV: &str = "OIDC_ISSUER";
pub const OIDC_JWKS_URI_ENV: &str = "OIDC_JWKS_URI";
pub const OIDC_AUDIENCE_ENV: &str = "OIDC_AUDIENCE";
// OIDC: when set to "1"/"true" requests without a valid token are rejected.
pub const OIDC_ENFORCE_ENV: &str = "OIDC_ENFORCE";