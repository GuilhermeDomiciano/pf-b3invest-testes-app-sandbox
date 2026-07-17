# Spec — test-runtime

**Capability:** test-runtime
**Status:** active
**Implementation:** partial — session boot loads dotenv before local/BS (change 0001); BS smoke deferred to 0002
**Realizes:** SC1, SC2, SC4
**Depends on:** —
**Last updated:** 2026-07-17
**Version:** 0.3.0

## Purpose

Orquestra a execução dos testes Robot da AppB3 em Android/iOS, escolhendo ambiente local (Appium) ou BrowserStack via variáveis e targets do makefile.

## Requirements (EARS)

### Ubiquitous

- The system shall expose Robot variables `PLATFORM_NAME` (`android` | `ios`) and `ENVIRONMENT` (`local` | `bs`) to select device platform and runtime target.
- The system shall launch the AppB3 application under test through shared core keywords before domain suites run.
- The system shall write Robot output under a configurable logs directory for each run.

### Event-driven

- When the suite starts, the system shall load dotenv configuration before selecting local or BrowserStack session keywords.
- When `ENVIRONMENT` is `local`, the system shall start the session against a local Appium server with the matching platform driver (UiAutomator2 or XCUITest).
- When `ENVIRONMENT` is `bs`, the system shall start the session against BrowserStack App Automate using credentials and settings from the environment (dotenv), not from committed secrets.
- When the operator invokes makefile targets `run-local-android`, `run-local-ios`, `run-bs-android`, or `run-bs-ios`, the system shall run suites under `robot/tests/` filtered by the configured tag (default `regressivo`).

### State-driven

- While parallel regressive execution is requested, the system shall support Pabot with domain tags (e.g. `-i gmud`) over `robot/tests/`.

### Unwanted-behavior (must-not)

- The system shall not require a different test codebase per platform for the same domain scenario.
- The system shall not commit APK/IPA binaries into the git tree as a runtime prerequisite.
- The system shall not embed BrowserStack username/access key literals in versioned settings used by the runtime.

### Optional

- Where a CI pipeline is available outside this repo, the system may be invoked with the same Robot variables used by the makefile.

## Acceptance criteria

1. [unverified] Local Android session starts AppB3 — verified by `resource/core/core.resource`, `resource/core/local/local.resource`.
2. [unverified] BrowserStack Android/iOS targets set ENVIRONMENT to bs — verified by `./makefile`, `resource/core/browserstack/browserstack.resource`.
3. [unverified] Default makefile TAGS value is regressivo — verified by `./makefile`.
4. [unverified] Suite boot loads `.env` before Open AppB3 when present — verified by `resource/tools/env_loader.py`, `resource/core/core.resource`

## Maturity

**MVP (committed):**

- Dual runtime local + BrowserStack for Android and iOS.
- Shared core open/launch keywords for AppB3.
- Makefile targets for the four platform×environment combinations.
- Dotenv boot before local/BS session (`Load Project Environment`); no hardcoded BS credentials in settings.

**Future (aspirational, not committed):**

- GitHub Actions (or Ultron) pipeline versioned in this repo.
- Fix `LOGS_DIR` / `LOG_DIR` makefile inconsistency (change 0002).
- Smoke/regressivo completo em BrowserStack App Automate (change 0002).

## Out of scope for this spec

- Domain scenario logic (login, wallet, etc.).
- Locator / screen / function layering (see `ui-layers`).
- Hosting or building the mobile app binary.
