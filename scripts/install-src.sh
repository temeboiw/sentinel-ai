#!/usr/bin/env bash
set -euo pipefail
BASE="https://raw.githubusercontent.com/temeboiw/sentinel-ai/main/dist/src"
rm -f src.b64 sentinel-ai-src.tar.gz
echo "Downloading source parts..."
curl -fsSL "$BASE/p0" > src.b64
curl -fsSL "$BASE/p1" >> src.b64
echo "Decoding..."
base64 -d < src.b64 > sentinel-ai-src.tar.gz
rm -f src.b64
echo "Extracting..."
tar xzf sentinel-ai-src.tar.gz
sudo apt-get update -qq
sudo apt-get install -y python3 python3-pip python3-venv
pip3 install -e .
echo "OK. Run:"
echo "  export NVIDIA_API_KEY=nvapi-..."
echo "  sentinel doctor"
