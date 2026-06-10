# EUIPO Trademark Clearance

Pre-filing trademark clearance against the EUTM register, with likelihood-of-confusion analysis under Art. 8.1.b EUTMR and CJEU case law.

## What it does

Queries the EUTM register via a configured EUIPO connector, identifies potentially conflicting earlier marks, and produces a structured risk report with a traffic-light rating (🔴 High / 🟡 Medium / 🟢 Low). Coverage and freshness depend entirely on the connector configured by the user.

The analysis applies the multi-factor test from CJEU case law:
- **Sign similarity** — visual, phonetic, and conceptual comparison (SABEL v Puma, C-251/95)
- **Goods/services similarity** — Canon factors (C-39/97)
- **Distinctiveness** — inherent and enhanced (Lloyd Schuhfabrik, C-342/97)
- **Global assessment** — interdependence of all factors

## Requirements

**A configured EUIPO connector** — this skill requires an MCP connector exposing a `search_trademarks` tool against the EUTM register. A reference implementation, pinned to a tagged release, is available at [Jatocao/euipo-mcp](https://github.com/Jatocao/euipo-mcp) (v0.1.0):

```json
{
  "mcpServers": {
    "EUIPO": {
      "command": "uvx",
      "args": ["--from", "git+https://github.com/Jatocao/euipo-mcp.git@v0.1.0", "euipo-mcp"],
      "env": {
        "EUIPO_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

API credentials: register at the [EUIPO API Portal](https://dev.euipo.europa.eu).

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

Contributed by a practising EU trademark attorney and Agente de la Propiedad Industrial.

## License

Apache 2.0
