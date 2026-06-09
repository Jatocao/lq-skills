# EUIPO Trademark Clearance

Pre-filing trademark clearance against the official EUIPO register, with likelihood-of-confusion analysis under Art. 8.1.b EUTMR and CJEU case law.

## What it does

Searches the EU trademark database in real time, identifies potentially conflicting earlier marks, and produces a structured risk report with a traffic-light rating (🔴 High / 🟡 Medium / 🟢 Low).

The analysis applies the multi-factor test from CJEU case law:
- **Sign similarity** — visual, phonetic, and conceptual comparison (SABEL v Puma, C-251/95)
- **Goods/services similarity** — Canon factors (C-39/97)
- **Distinctiveness** — inherent and enhanced (Lloyd Schuhfabrik, C-342/97)
- **Global assessment** — interdependence of all factors

## Requirements

**EUIPO MCP connector** — this skill requires live access to the EUIPO trademark API. Configure the connector before use:

```json
{
  "mcpServers": {
    "EUIPO": {
      "type": "stdio",
      "command": "python",
      "args": ["-m", "euipo_mcp_server"]
    }
  }
}
```

API credentials: register at [EUIPO Developer Portal](https://euipo.europa.eu/ohimportal/en/open-data).

## Usage

```
Check if AURORA is available in class 32 (beverages) before we file at the EUIPO
```

```
Run a clearance search for NOVATECH in classes 9 and 42
```

The skill will ask for Nice classes if not provided. It produces either an **internal** report (full legal analysis, all conflicts, CJEU citations) or a **client** report (plain language, top conflicts only).

## Jurisdiction

EU — EUTM register only. Does not cover national registers (OEPM Spain, UKIPO, INPI France, etc.). For comprehensive clearance, complement with national searches.

## Author

Contributed by a practising EU trademark attorney and Agente de la Propiedad Industrial. Built and tested against the EUIPO production API.

## License

Apache 2.0
