# Spec Delta — capability: test-services

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-services/spec.md`

```ops
set-header Implementation: partial — dotenv loader + removal of hardcoded secrets (change 0001)
bump-version minor
append-criterion [unverified] Secrets for BrowserStack and Mailsac are loaded from environment / `.env`, not committed in resources — verified by `resource/tools/env_loader.py`, `.env.example`
append-criterion [unverified] `.env.example` lists required keys without real secret values — verified by `.env.example`
```

---

## Requirements changes (manual merge on apply if ops alone insufficient)

### Ubiquitous — ADD

- The system shall load project secrets and environment-specific values from a root `.env` file (via dotenv) into Robot variables at suite boot.
- The system shall ship a committed `.env.example` that enumerates every required key with non-secret placeholders.

### Event-driven — ADD

- When a required secret is missing for the active `ENVIRONMENT`, the system shall fail fast with an explicit error before opening an Appium session.

### State-driven — REPLACE the credentials bullet

- While credentials for BrowserStack or Mailsac are required, the system shall read them from the process environment / `.env` (never from committed plain-text tokens in resource files).

### Unwanted-behavior — ADD

- The system shall not commit a real `.env` file or real secret values inside `.env.example`.

### Maturity

- Move “Move BrowserStack/Mailsac secrets to environment variables” from **Future** to **MVP (committed)** for this change.
- Keep real exclude-register API in **Future**.
