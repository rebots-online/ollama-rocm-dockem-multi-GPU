# syntax=docker/dockerfile:1.4
FROM ollama/ollama:0.9.0@sha256:2ea3b768a8f2dcd4d910f838d79702bb952089414dd578146619c0a939647ac6

USER root

# At build time, mount /opt/rocm from the host and copy it into the image
RUN --mount=type=bind,source=/opt/rocm,target=/tmp/rocm,ro \
    cp -a /tmp/rocm /opt/rocm

# Point Ollama at the ROCm libs and force-load both XTs
env AMD_PATH=/opt/rocm \
    LD_LIBRARY_PATH=/opt/rocm/lib64:/opt/rocm/lib \
    HSA_OVERRIDE_GFX_VERSION=10.3.0 \
    ROCR_VISIBLE_DEVICES=0,1

USER 1000
# Inherits ENTRYPOINT ["ollama","serve"]
