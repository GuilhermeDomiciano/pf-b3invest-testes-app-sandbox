# Spec — home

**Capability:** home
**Status:** active
**Implementation:** partial — open finance e outros itens marcados fora do MVP no código
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, login
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza a home pós-login da AppB3: navegação e validações dos componentes commitados no MVP da suite `home.robot`.

## Requirements (EARS)

### Ubiquitous

- The system shall provide home screen and function keywords with locators in `robot/elements/home.yaml`.
- The system shall keep executable home scenarios under `robot/tests/home.robot`.

### Event-driven

- When the user is authenticated, the system shall open and validate home surfaces via home keywords.
- When a home scenario is tagged out of MVP in source comments, the system shall leave it disabled or clearly marked until re-enabled by a change.

### State-driven

- While on the home screen, the system shall navigate to linked domains (wallet, earnings, statement, stock) through home entry points where the suite covers them.

### Unwanted-behavior (must-not)

- The system shall not treat open-finance (or other “saiu do MVP”) cases as committed acceptance until reactivated.

### Optional

- Where product re-enables open finance on home, the system may add scenarios under a future change.

## Acceptance criteria

1. [unverified] Home suite exists — verified by `robot/tests/home.robot`.
2. [unverified] Home screen, functions, and YAML exist — verified by `robot/screens/home/home_screen.resource`, `robot/functions/home/home_functions.resource`, `robot/elements/home.yaml`.

## Maturity

**MVP (committed):**

- Home suite for current MVP widgets/navigation.

**Future (aspirational, not committed):**

- Open finance scenarios currently commented as out of MVP.
- Any home widgets not yet covered by keywords.

## Out of scope for this spec

- Deep wallet/earnings/statement/stock assertions (domain specs).
