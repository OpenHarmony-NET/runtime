#!/usr/bin/env bash
sudo docker run --rm \
    -v ./:/runtime \
    -w /runtime \
    -e ROOTFS_DIR="/crossrootfs/arm" \
    mcr.microsoft.com/dotnet-buildtools/prereqs:azurelinux-3.0-net9.0-cross-arm-musl \
    bash -c "./build.sh --subset clr.aot+libs --configuration Release -arch arm --cross \
    && mkdir -p ./artifacts/openharmony/arm/sdk/ \
    && mkdir -p ./artifacts/openharmony/arm/framework/ \
    && cp -p ./artifacts/bin/coreclr/linux.arm.Release/aotsdk/* ./artifacts/openharmony/arm/sdk/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-arm/*.a ./artifacts/openharmony/arm/framework/ \
    && cp -p ./artifacts/bin/runtime/net9.0-linux-Release-arm/*.dbg ./artifacts/openharmony/arm/framework/"