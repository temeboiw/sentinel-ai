# Sentinel AI

**Native NVIDIA NIM coding IDE for the shell.**

Direct HTTPS to `https://integrate.api.nvidia.com/v1/chat/completions` — no LiteLLM, no gateway, no Claude Code.

## Install (.deb — proot / Debian / Ubuntu)

### arm64 / aarch64 (phones, Pi, Apple Silicon VMs)

```bash
curl -L -o sentinel-ai_1.0.0_arm64.deb \
  https://github.com/temeboiw/sentinel-ai/releases/download/v1.0.0/sentinel-ai_1.0.0_arm64.deb
sudo dpkg -i sentinel-ai_1.0.0_arm64.deb
sudo apt-get install -f
export NVIDIA_API_KEY="nvapi-..."
sentinel doctor
sentinel
```

### amd64

```bash
curl -L -o sentinel-ai_1.0.0_amd64.deb \
  https://github.com/temeboiw/sentinel-ai/releases/download/v1.0.0/sentinel-ai_1.0.0_amd64.deb
sudo dpkg -i sentinel-ai_1.0.0_amd64.deb
```

`sentinel` is installed to `/usr/bin/sentinel` (on PATH).
Config: `~/.config/sentinel-ai/`

## Install from source

```bash
pip install -e ".[dev]"
export NVIDIA_API_KEY="nvapi-..."
sentinel
```

## Default model

`nvidia/nemotron-3-ultra-550b-a55b`

## License

MIT
