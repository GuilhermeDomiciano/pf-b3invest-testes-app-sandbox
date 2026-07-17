# Spec Delta — capability: test-runtime

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-runtime/spec.md`

```ops
set-header Implementation: partial — session boot loads dotenv before local/BS (change 0001); BS smoke deferred to 0002
bump-version minor
append-criterion [unverified] Suite boot loads `.env` before Open AppB3 when present — verified by `resource/tools/env_loader.py`, `resource/core/core.resource`
```

---

## Requirements changes (manual merge)

### Event-driven — ADD

- When the suite starts, the system shall load dotenv configuration before selecting local or BrowserStack session keywords.

### Unwanted-behavior — ADD

- The system shall not embed BrowserStack username/access key literals in versioned settings used by the runtime.

### Maturity

- Keep dual runtime MVP.
- Move “Remove hardcoded BrowserStack credentials from settings” from **Future** into **MVP** (delivered by 0001).
- Leave makefile `LOGS_DIR`/`LOG_DIR` fix and full BS smoke to change **0002**.
