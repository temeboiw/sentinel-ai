# Install Sentinel AI

## Option A — from source (use this if the .deb is only a few bytes)

```bash
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-venv git
git clone https://github.com/temeboiw/sentinel-ai.git
cd sentinel-ai
pip3 install -e .
export NVIDIA_API_KEY="nvapi-..."
sentinel doctor
sentinel
```

## Option B — arm64 .deb

File must be **4958334 bytes**, MD5 **859d7b4b3067b860e17e75902a1f8b2f**.
A 9-byte file is a failed download — delete it and use Option A.
