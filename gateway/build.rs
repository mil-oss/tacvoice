use std::path::PathBuf;

fn main() {
    println!("cargo:rerun-if-changed=proto/");

    let out_dir = PathBuf::from("src/grpc");
    std::fs::create_dir_all(&out_dir).unwrap();

    let mut prost_config = prost_build::Config::new();
    prost_config.out_dir(&out_dir);
    for message in ["tacvoice.RecordMessage", "tacvoice.SubmitMessage"] {
        prost_config.type_attribute(
            message,
            "#[derive(::serde::Serialize, ::serde::Deserialize)]",
        );
    }

    prost_config
        .compile_protos(
            &[
                "proto/tacvoice_service.proto",
                "proto/transcriber_service.proto",
                "proto/recognizer_service.proto",
            ],
            &["proto"],
        )
        .unwrap();

    let tacvoice_service = tonic_build::manual::Service::builder()
        .name("TacvoiceService")
        .package("tacvoice")
        .method(
            tonic_build::manual::Method::builder()
                .name("log_action")
                .route_name("LogAction")
                .input_type("crate::grpc::tacvoice::Action")
                .output_type("crate::grpc::tacvoice::LogResponse")
                .codec_path("tonic_prost::ProstCodec::<_, _>")
                .build(),
        )
        .method(
            tonic_build::manual::Method::builder()
                .name("get_message_form")
                .route_name("GetMessage")
                .input_type("crate::grpc::tacvoice::GetMessageRequest")
                .output_type("crate::grpc::tacvoice::GetMessageResponse")
                .codec_path("tonic_prost::ProstCodec::<_, _>")
                .build(),
        )
        .method(
            tonic_build::manual::Method::builder()
                .name("get_catalog")
                .route_name("GetCatalog")
                .input_type("crate::grpc::tacvoice::GetCatalogRequest")
                .output_type("crate::grpc::tacvoice::GetCatalogResponse")
                .codec_path("tonic_prost::ProstCodec::<_, _>")
                .build(),
        )
        .build();

    let transcriber_service = tonic_build::manual::Service::builder()
        .name("TranscriberService")
        .package("transcriber")
        .method(
            tonic_build::manual::Method::builder()
                .name("publish_transcription")
                .route_name("PublishTranscription")
                .input_type("crate::grpc::transcriber::PublishTranscriptionRequest")
                .output_type("crate::grpc::transcriber::PublishTranscriptionResponse")
                .codec_path("tonic_prost::ProstCodec::<_, _>")
                .build(),
        )
        .build();

    let recognizer_service = tonic_build::manual::Service::builder()
        .name("RecognizerService")
        .package("recognizer")
        .method(
            tonic_build::manual::Method::builder()
                .name("publish_recognition")
                .route_name("PublishRecognition")
                .input_type("crate::grpc::recognizer::PublishRecognitionRequest")
                .output_type("crate::grpc::recognizer::PublishRecognitionResponse")
                .codec_path("tonic_prost::ProstCodec::<_, _>")
                .build(),
        )
        .build();

    tonic_build::manual::Builder::new()
        .build_client(false)
        .build_server(true)
        .out_dir(&out_dir)
        .compile(&[tacvoice_service, transcriber_service, recognizer_service]);
}
