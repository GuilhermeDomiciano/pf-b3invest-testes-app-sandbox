# Spec Delta — capability: test-runtime

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-runtime/spec.md`

```ops
set-header Implementation: partial — BS App Automate runnable via makefile + env app ids (change 0002); full regressive sign-off may remain manual
bump-version minor
append-criterion [unverified] `make run-bs-android` and `make run-bs-ios` write logs under the configured logs directory — verified by `./makefile`
append-criterion [unverified] BrowserStack session fails fast when `APP_ANDROID_BS` / `APP_IOS_BS` or credentials are missing — verified by `resource/core/browserstack/browserstack.resource`
append-criterion [unverified] Docs describe App Automate upload and `.env` app id setup for BS runs — verified by `docs/README.md`
```

---

## Requirements changes (manual merge)

### Event-driven — REPLACE / CLARIFY

- When `ENVIRONMENT` is `bs`, the system shall start the session against BrowserStack **App Automate** using credentials and app ids from the environment (dotenv), not from committed secrets.

### Event-driven — ADD

- When the operator runs `run-bs-android` or `run-bs-ios`, the system shall execute tagged suites under `robot/tests/` with logs written to the makefile logs directory (no `LOG_DIR` / `LOGS_DIR` mismatch).

### Unwanted-behavior — ADD

- The system shall not require domain suite forks for BrowserStack (same `.robot` files as local).

### Maturity

- Fix makefile log variable inconsistency: move from Future → MVP (this change).
- Document BS App Automate run path as MVP.
- Full parallel `pabot` on BS remains optional/Future until smoke is stable.
