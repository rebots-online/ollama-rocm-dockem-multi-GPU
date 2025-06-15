# Ollama ROCm Dockem Multi-GPU  
*(Dual-GPU support)*

Run Ollama LLM server with AMD ROCm-powered dual-GPU support.

## Features
- Custom Docker image bundling ROCm v6 libraries for AMD GPUs
- Docker Compose setup for Umbrel integration
- Dual-container script for quick pinning (each GPU separately)

## Prerequisites
- Host with ROCm v6 installed at `/opt/rocm`
- Docker & Docker Compose
- AMD GPUs supported by ROCm (e.g., RX 6600 XT)

## Quickstart

```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/ollama-rocm-dockem-multi-GPU.git  # replace <YOUR_GITHUB_USERNAME> with your GitHub user  # replace with your GitHub repo URL
cd ollama-rocm-dockem-multi-GPU

export DOCKER_BUILDKIT=1
docker compose build ollama  # builds the 'ollama' service using the image tag <YOUR_DOCKERHUB_USERNAME>/ollama-rocm-dockem-multi-GPU:latest
docker compose up -d  # ensure the 'image:' in docker-compose.yml points to <YOUR_DOCKERHUB_USERNAME>/ollama-rocm-dockem-multi-GPU:latest
