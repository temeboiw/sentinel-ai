# Sentinel AI Project Instructions

This repository is **Sentinel AI** — a standalone terminal coding IDE that talks directly to NVIDIA NIM.

## Architecture constraints (do not violate)

- Connect only to `https://integrate.api.nvidia.com/v1` (or user-configured base URL).
- Use Bearer `NVIDIA_API_KEY` authentication.
- Do **not** introduce LiteLLM, API gateways, Anthropic SDKs, or Claude Code.
- Keep the CLI entrypoint as `sentinel`.
- Prefer minimal, tested changes. Run `pytest` after substantive edits.

## Layout

- `src/sentinel/` — application package
- `tests/` — unit and optional live integration tests
- Config lives in `~/.config/sentinel-ai/`

## Build / test

```bash
pip install -e ".[dev]"
pytest -q
```
