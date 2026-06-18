Uniform Defense Stack Integration

Ref: /mnt/HARDONE/NSI_Repos/tacvoice/doc/llms-full.txt

Project: 
/mnt/HARDONE/NSI_Repos/tacvoice/doc/project.md
/mnt/HARDONE/NSI_Repos/tacvoice/doc/TacVoice.pdf
/mnt/HARDONE/NSI_Repos/tacvoice/service


1. Background

    a. We are required to implement tacvoice using UDS - which is an environment that is designed to protect data, can be verified using automated processes, and allows our capability to be employed by other services that exist there.

    b. Because message information, transcription software, recognition software, voice libraries and application logs each represent concerns that have different security requirements, we are required to implement these functions using separate binaries, each defined in the service/src/bin folder.

    c. Zero Trust Services: key-service, policy-service, and orderwire-service and file-service are used internally and depend on tacvoice_policy configuration.  voice-repo and messsage repo are separate implementations of repository-service.

    d. TacVoice Services: tacvoice-service, transcriber and recognizer are separate binaries that communicate with services using Orderwire clients.

    e. tacvoice_policy.xml has been updated to include "Exchanges" items with Messages so that content can be contolled by policy logic, and Entities.

    f. The Policy XML is based on an XML Schema at service/assets/xml/xsd/policy/policy-imp.xsd which supports a number of ways to create, express, and verify information exchange rules in an application independent way so that information is routed or accessed based on its content.  We want to be able to express and control all security requirements in this file.


6. TacVoice Refactor

    a. Implement the current service using the (10) binaries in service/src/bin so that tacvoice-service pulls data resources from voice-repo and message repo, and the UI communicates with transcriber and recognizer separately.

    b. Examine Unified Defense Stack (UDS) documentation and create a script that employs information from tacvoice_policy.xml to deploy a minimal kuberenetes cluster to support (10) containers, and update the tacvoice_policy.xml file with corresponding IP addresses.

    c. Examine Unified Defense Stack (UDS) documentation in order to use zarf to create sboms, deploy the executables, and pepr to enforce access controls specified in the policy.

    d. The Zero Trust services in service/src/ztxs uses FIPS compliant mTLS, but the UDS uses Istio (also mTLS) for networking and service mesh.  Provide integration or refactor recommendations.

    e. Our application must support standard OIDC SSO flows so that it can supportcentralized identity (https://docs.defenseunicorns.com/core/concepts/core-features/identity-and-authorization/). Provide integration or refactor recommendations.

    e. Use this to deploy tacvoice service in a kubernetes cluster on the local machine.

    f. Monitoring & Observability: default platform bundle is k3d-core-demo (Grafana,
       Loki, Prometheus). Slim-dev cannot add observability incrementally; see
       uds/docs/observability.md and install_uds_observability.sh.

7. Apply Policies

    a. Use the Policy XML to express rules that can be applied to messages.xml instances so that

    "Messages will be accessible only to operators from the target entity."
    "Any messages with location information will be accessible by the Operations entity"
    "Location information will be redacted from messages accessed by non-Operations entities"