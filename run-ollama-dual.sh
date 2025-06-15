#!/usr/bin/env bash
# Quick dual-container setup (each pinned to one GPU)

# First instance on GPU 0
docker run -d \
  --name ollama0 \
  --device /dev/kfd:/dev/kfd \
  --device /dev/dri:/dev/dri \
  --privileged \
  -p 11434:11434 \
  -e ROCR_VISIBLE_DEVICES=0 \
  ollama/ollama:0.9.0 serve

# Second instance on GPU 1
docker run -d \
  --name ollama1 \
  --device /dev/kfd:/dev/kfd \
  --device /dev/dri:/dev/dri \
  --privileged \
  -p 11435:11434 \
  -e ROCR_VISIBLE_DEVICES=1 \
  ollama/ollama:0.9.0 serve
