# Spec — walkthrough

**Capability:** walkthrough
**Status:** active
**Implementation:** partial — screens/elements present; dedicated `.robot` suite not listed under `robot/tests/`
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Fornece keywords de walkthrough/onboarding da AppB3 para compor jornadas de primeiro acesso (cadastro/login) sem acoplar seletores aos domínios.

## Requirements (EARS)

### Ubiquitous

- The system shall provide walkthrough screen keywords with locators in `robot/elements/walkthrough.yaml`.

### Event-driven

- When onboarding/walkthrough screens appear, the system shall advance or dismiss steps via walkthrough keywords.

### State-driven

- While the app is in walkthrough state, the system shall keep interactions in walkthrough resources rather than login/cadastro screens.

### Unwanted-behavior (must-not)

- The system shall not invent a standalone regressive walkthrough suite claim without a corresponding `robot/tests/` file.

### Optional

- Where product requires a dedicated walkthrough suite, the system may add `robot/tests/walkthrough.robot` under a future change.

## Acceptance criteria

1. [unverified] Walkthrough screen resource exists — verified by `robot/screens/walkthrough/walkthrough_screen.resource`.
2. [unverified] Walkthrough locators exist — verified by `robot/elements/walkthrough.yaml`.

## Maturity

**MVP (committed):**

- Reusable walkthrough screen + YAML for composition by other flows.

**Future (aspirational, not committed):**

- Dedicated walkthrough test suite if product wants regressive coverage of onboarding alone.

## Out of scope for this spec

- Full cadastro/login business assertions.
