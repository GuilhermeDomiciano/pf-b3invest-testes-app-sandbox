# Spec — statement

**Capability:** statement
**Status:** active
**Implementation:** implemented
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, login, home
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza o extrato (statement) da AppB3 na home de extrato coberta pela suite Robot.

## Requirements (EARS)

### Ubiquitous

- The system shall provide statement screen and function keywords with locators in `robot/elements/statement.yaml`.
- The system shall keep executable statement scenarios under `robot/tests/statement/`.

### Event-driven

- When the user opens extrato from the authenticated app, the system shall navigate and assert via statement keywords.

### State-driven

- While on the statement home, the system shall validate the UI elements defined in the statement YAML/screen resources.

### Unwanted-behavior (must-not)

- The system shall not embed statement locators inside unrelated domain suites when statement resources exist.

### Optional

- Where additional statement filters/periods are added by product, the system may extend suites under this capability.

## Acceptance criteria

1. [unverified] Statement suite exists — verified by `robot/tests/statement/statement_home.robot`.
2. [unverified] Screen, functions, and YAML exist — verified by `robot/screens/statement/statement_screen.resource`, `robot/functions/statement/statement_functions.resource`, `robot/elements/statement.yaml`.

## Maturity

**MVP (committed):**

- Statement home suite + layered resources.

**Future (aspirational, not committed):**

- Deeper period/filter coverage if product expands extrato UX.

## Out of scope for this spec

- Earnings proventos and wallet holdings.
