Uniform Defense Stack Integration

Ref: 
/mnt/HARDONE/NSI_Repos/tacvoice/doc/llms-full.txt
https://docs.defenseunicorns.com/core/how-to-guides/packaging-applications/create-uds-package/

Project: 
/mnt/HARDONE/NSI_Repos/tacvoice/doc/project.md
/mnt/HARDONE/NSI_Repos/tacvoice/doc/TacVoice.pdf
/mnt/HARDONE/NSI_Repos/tacvoice/service

Uniform Defense Stack Integration

Ref: 
/mnt/HARDONE/NSI_Repos/tacvoice/doc/llms-full.txt
https://docs.defenseunicorns.com/core/how-to-guides/packaging-applications/create-uds-package/

1. Background

    a. Once we have verified a capability to deploy packages in UDS clusters we need a way to provide them to other clusters.

    b. When a package is used, we will maintain logs that add provenance to the employment metadata so that testing application scan verify the source, version and age of a package, as well as access build logs for in-depth investigation.

2. Create an independent GHCR service similar to UDS Registry that performs the same functions using ZTXS services.