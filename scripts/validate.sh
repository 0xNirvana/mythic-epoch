#!/usr/bin/env bash
# Validate Epoch repo: unit tests + optional Mythic folder install.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "[*] Running protocol unit tests..."
python3 -m unittest discover -s tests -p "test_*.py" -v

if [[ -x "${MYTHIC_DIR:-$HOME/Mythic}/mythic-cli" ]]; then
  echo "[*] Installing into Mythic from $ROOT..."
  (cd "${MYTHIC_DIR:-$HOME/Mythic}" && sudo ./mythic-cli install folder "$ROOT" -f)
  echo "[+] mythic-cli install folder completed"
else
  echo "[!] Mythic not found at ${MYTHIC_DIR:-$HOME/Mythic}; skipping install"
fi

echo "[+] Epoch validation done"
