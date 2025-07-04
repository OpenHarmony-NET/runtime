#!/usr/bin/env bash
docker run --rm \
    -v ./:/runtime \
    -w /runtime \
    -e ROOTFS_DIR="/crossrootfs/arm64" \
    mcr.microsoft.com/dotnet-buildtools/prereqs:azurelinux-3.0-net9.0-cross-arm64-musl \
    bash -c "./build.sh --subset clr.aot+libs --configuration Release -arch arm64 --cross --os openharmony\
    && mkdir -p ./artifacts/openharmony/arm64/sdk/ \
    && mkdir -p ./artifacts/openharmony/arm64/framework/ \
    && cp -p ./artifacts/bin/coreclr/openharmony.arm64.Release/aotsdk/* ./artifacts/openharmony/arm64/sdk/ \
    && cp -p ./artifacts/bin/runtime/net9.0-openharmony-Release-arm64/*.a ./artifacts/openharmony/arm64/framework/ \
    && cp -p ./artifacts/bin/runtime/net9.0-openharmony-Release-arm64/*.dbg ./artifacts/openharmony/arm64/framework/"