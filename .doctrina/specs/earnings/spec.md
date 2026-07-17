# Spec — earnings

**Capability:** earnings
**Status:** active
**Implementation:** partial — validação de “data de hoje” em a receber e limitações de filtros pendentes
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, login, home
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza proventos na AppB3: radar, recebidos, a receber e filtros associados.

## Requirements (EARS)

### Ubiquitous

- The system shall provide earnings screen, filter screen, and function keywords.
- The system shall keep earnings locators in `robot/elements/earnings.yaml` and `robot/elements/earnings_filter.yaml`.
- The system shall keep suites under `robot/tests/earnings/` for radar, received, and to-receive flows.

### Event-driven

- When the user opens proventos, the system shall navigate radar / recebidos / a receber via earnings keywords.
- When filters are applied, the system shall use earnings filter keywords where locators are available.

### State-driven

- While viewing to-receive earnings, the system shall assert list/content rules covered by the current suite (date-of-today checks remain debt until implemented).

### Unwanted-behavior (must-not)

- The system shall not mark “data de hoje” validation as complete while the suite still notes it as pending.

### Optional

- Where filter accessibility improves in the app, the system may expand filter coverage.

## Acceptance criteria

1. [unverified] Earnings suites exist — verified by `robot/tests/earnings/earnings_radar.robot`, `robot/tests/earnings/earnings_received.robot`, `robot/tests/earnings/earnings_to_receive.robot`.
2. [unverified] Screen/function/YAML layers exist — verified by `robot/screens/earnings/`, `robot/functions/earnings/`, `robot/elements/earnings.yaml`, `robot/elements/earnings_filter.yaml`.

## Maturity

**MVP (committed):**

- Radar, recebidos, a receber suites with layered keywords.

**Future (aspirational, not committed):**

- Robust “data de hoje” assertion on to-receive.
- Broader filter coverage when Flutter locators allow.

## Out of scope for this spec

- Wallet product details and statement extrato.
