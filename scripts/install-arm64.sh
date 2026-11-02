#!/usr/bin/env bash
set -euo pipefail
# Reconstruct sentinel-ai_1.0.0_arm64.deb from base64 parts on GitHub
BASE="https://raw.githubusercontent.com/temeboiw/sentinel-ai/main/dist/arm64"
OUT="sentinel-ai_1.0.0_arm64.deb"
EXPECTED_MD5="859d7b4b3067b860e17e75902a1f8b2f"
EXPECTED_SIZE=4958334

rm -f "$OUT" "$OUT.b64"
echo "Downloading 20 parts..."
for i in $(seq -w 0 19); do
  echo "  part $i"
  curl -fsSL "$BASE/p$i" >> "$OUT.b64"
done
echo "Decoding..."
base64 -d < "$OUT.b64" > "$OUT"
rm -f "$OUT.b64"
SIZE=$(wc -c < "$OUT" | tr -d ' ')
MD5=$(md5sum "$OUT" | awk '{print $1}')
echo "Size: $SIZE (expected $EXPECTED_SIZE)"
echo "MD5:  $MD5 (expected $EXPECTED_MD5)"
if [ "$SIZE" != "$EXPECTED_SIZE" ] || [ "$MD5" != "$EXPECTED_MD5" ]; then
  echo "VERIFY FAILED — incomplete download"
  exit 1
fi
echo "OK — installing..."
sudo dpkg -i "$OUT" || sudo apt-get install -f -y
echo "Done. Run: export NVIDIA_API_KEY=nvapi-... && sentinel doctor"
