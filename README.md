# Epoch

Mythic **C2 profile** — Google Calendar dead-drop relay for Mythic agents.

Epoch shuttles encrypted blobs between Mythic and Google Calendar. It never decrypts agent traffic. Pairs with the **[Chronos](https://github.com/0xNirvana/chronos)** agent (`PROTO_VERSION = "2"` must match).

> **Authorized use only.** Research and authorized red-team training.

## Install

[Mythic External Agent](https://github.com/MythicMeta/Mythic_External_Agent) layout — install from your Mythic host:

```bash
cd ~/Mythic
sudo ./mythic-cli install github https://github.com/0xNirvana/epoch
sudo ./mythic-cli start epoch
```

Local folder install (development):

```bash
sudo ./mythic-cli install folder /path/to/public/epoch
```

## Quick start

1. Enable Google Calendar API; create service account + shared calendar ([docs](documentation-c2/epoch/_index.md))
2. Install **Chronos** as well
3. Configure Epoch in Mythic UI (calendar ID + credentials JSON)
4. Build a Chronos payload (writes runtime `c2_code/config.json`)
5. Start Epoch, run the agent

## Repository layout

```
config.json
C2_Profiles/epoch/       # Profile container (Dockerfile, main.py, c2_code/, mythic/)
documentation-c2/epoch/  # Mythic UI docs
agent_icons/
tests/
```

## Tests

```bash
python3 -m unittest discover -s tests -p "test_*.py" -v
```

## License

MIT — see [LICENSE](LICENSE).
