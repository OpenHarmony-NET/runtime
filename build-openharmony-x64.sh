#!/usr/bin/env bash
docker run --rm \
    -v ./:/runtime \
    -w /runtime \
    -e ROOTFS_DIR="/crossrootfs/x64" \
    mcr.microsoft.com/dotnet-buildtools/prereqs:azurelinux-3.0-net9.0-cross-amd64-musl \
    bash -c "./build.sh --subset clr.aot+libs --configuration Release -arch x64 --cross --os openharmony\
    && mkdir -p ./artifacts/openharmony/x64/sdk/ \
    && mkdir -p ./artifacts/openharmony/x64/framework/ \
    && cp -p ./artifacts/bin/coreclr/openharmony.x64.Release/aotsdk/* ./artifacts/openharmony/x64/sdk/ \
    && cp -p ./artifacts/bin/runtime/net9.0-openharmony-Release-x64/*.a ./artifacts/openharmony/x64/framework/ \
    && cp -p ./artifacts/bin/runtime/net9.0-openharmony-Release-x64/*.dbg ./artifacts/openharmony/x64/framework/"