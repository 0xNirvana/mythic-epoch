# Epoch

**Google Calendar dead-drop C2 for [Mythic](https://github.com/its-a-feature/Mythic).**

Epoch is a Mythic **C2 profile** — a Docker relay between Mythic and Google Calendar. Tasking and results move through shared calendar events. From the network, agents only talk to `googleapis.com`, not Mythic directly.

The reference agent is **[Chronos](https://github.com/0xNirvana/chronos)**. Install both repos; `PROTO_VERSION = "2"` must match across releases.

| Role | What it does |
|------|----------------|
| **Epoch** | Mythic ↔ Calendar relay (dumb transport) |
| **Chronos** | Target agent — polls Calendar, runs commands |

> **Authorized use only.** Research and authorized red-team training on systems and accounts you own or have permission to test.

## Install

[Mythic External Agent](https://github.com/MythicMeta/Mythic_External_Agent) layout:

```bash
cd ~/Mythic
sudo ./mythic-cli install github https://github.com/0xNirvana/epoch
sudo ./mythic-cli start epoch
```

Local folder install:

```bash
sudo ./mythic-cli install folder /path/to/public/epoch
```

## Quick start

1. Enable Google Calendar API; create service account + shared calendar ([docs](documentation-c2/epoch/_index.md))
2. Install **[Chronos](https://github.com/0xNirvana/chronos)** as well
3. Configure Epoch in Mythic UI (calendar ID + credentials JSON)
4. Build a Chronos payload (writes runtime `c2_code/config.json`)
5. Start Epoch, run the agent

## Constraints

- **Latency** — ~30–120s per task round trip (poll-interval dependent)
- **Scale** — ~10–20 agents per shared calendar before API quota gets tight
- **Files** — not a bulk exfil channel; agents cap transfers at ~500 KB

## Tests

```bash
python3 -m unittest discover -s tests -p "test_*.py" -v
```

## License

MIT — see [LICENSE](LICENSE).
