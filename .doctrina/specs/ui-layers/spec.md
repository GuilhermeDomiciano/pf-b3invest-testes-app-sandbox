# Spec — ui-layers

**Capability:** ui-layers
**Status:** active
**Implementation:** implemented
**Realizes:** SC3
**Depends on:** test-runtime
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Mantém a separação entre locators (YAML), ações de UI (screens), lógica de fluxo (functions) e casos de teste (`.robot`), para que domínios reutilizem keywords sem acoplar seletores aos testes.

## Requirements (EARS)

### Ubiquitous

- The system shall store UI locators as YAML under `robot/elements/`.
- The system shall implement screen-level Appium interactions under `robot/screens/`.
- The system shall implement reusable domain flows under `robot/functions/`.
- The system shall keep executable scenarios under `robot/tests/` importing functions/screens rather than embedding raw locators.
- The system shall share common imports and setup via `robot/base.resource`.

### Event-driven

- When a screen keyword needs an element, the system shall resolve it from the corresponding YAML locator file.
- When a test case needs a multi-step user journey, the system shall call function-layer keywords rather than duplicating screen steps inline.

### State-driven

- While a domain has screens and functions, the system shall keep element keys for that domain in a dedicated YAML file (or set of files) under `robot/elements/`.

### Unwanted-behavior (must-not)

- The system shall not place platform-specific raw locators directly inside `.robot` test cases when an element YAML already exists for that screen.
- The system shall not mix BrowserStack/local session setup into domain screen resources (session setup belongs to `test-runtime` / core).

### Optional

- Where element utilities help (scroll, swipe, money regex), the system may use helpers under `resource/utils/` and `resource/tools/`.

## Acceptance criteria

1. [unverified] Domains listed in intake have YAML + screen and/or function resources — verified by `robot/elements/`, `robot/screens/`, `robot/functions/`.
2. [unverified] Suites under `robot/tests/` import layered resources via `robot/base.resource` — verified by `robot/base.resource`, `robot/tests/login.robot`.
3. [unverified] Docs describe the layers (elements / screens / functions / tests) — verified by `docs/README.md`.

## Maturity

**MVP (committed):**

- Four-layer layout for all current domains.
- Shared base resource and element utilities.

**Future (aspirational, not committed):**

- Replace absolute-pixel swipes with relative/element-based gestures.
- Fix typo `wallet_details_screnn.resource` filename.

## Out of scope for this spec

- Runtime session creation (see `test-runtime`).
- Business assertions per domain (see domain specs).
