#!/usr/bin/env bash
# Create GitHub release v1.0.0 and upload both .deb packages.
# Requires: gh auth login
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if ! command -v gh >/dev/null; then
  echo "Install GitHub CLI: https://cli.github.com/"
  exit 1
fi

ARM64="${1:-$ROOT/sentinel-ai_1.0.0_arm64.deb}"
AMD64="${2:-$ROOT/sentinel-ai_1.0.0_amd64.deb}"

for f in "$ARM64" "$AMD64"; do
  if [[ ! -f "$f" ]]; then
    echo "Missing package: $f"
    exit 1
  fi
done

gh release create v1.0.0 \
  "$ARM64" \
  "$AMD64" \
  --repo temeboiw/sentinel-ai \
  --title "Sentinel AI v1.0.0" \
  --notes "Native NVIDIA NIM coding IDE for the shell.

## arm64
\
```bash
curl -L -o sentinel-ai_1.0.0_arm64.deb \\
  https://github.com/temeboiw/sentinel-ai/releases/download/v1.0.0/sentinel-ai_1.0.0_arm64.deb
sudo dpkg -i sentinel-ai_1.0.0_arm64.deb
```

## amd64
\
```bash
curl -L -o sentinel-ai_1.0.0_amd64.deb \\
  https://github.com/temeboiw/sentinel-ai/releases/download/v1.0.0/sentinel-ai_1.0.0_amd64.deb
sudo dpkg -i sentinel-ai_1.0.0_amd64.deb
```
"

echo "Release published."
echo "arm64 curl:"
echo "  curl -L -o sentinel-ai_1.0.0_arm64.deb https://github.com/temeboiw/sentinel-ai/releases/download/v1.0.0/sentinel-ai_1.0.0_arm64.deb"
