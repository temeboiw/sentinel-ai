# arm64 package parts

The `.deb` is split into base64 parts because the GitHub connector cannot attach binary release assets from this environment.

Reconstruct and install:

```bash
curl -fsSL https://raw.githubusercontent.com/temeboiw/sentinel-ai/main/scripts/install-arm64.sh | bash
```

Or manually:

```bash
# after all dist/arm64/part.* are present
cat dist/arm64/part.* | base64 -d > sentinel-ai_1.0.0_arm64.deb
sudo dpkg -i sentinel-ai_1.0.0_arm64.deb
```
