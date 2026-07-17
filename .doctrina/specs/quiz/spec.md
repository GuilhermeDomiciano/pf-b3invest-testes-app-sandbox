# Spec — quiz

**Capability:** quiz
**Status:** active
**Implementation:** implemented
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza o quiz / questionário da AppB3 coberto pela suite Robot existente, com locators e keywords dedicados.

## Requirements (EARS)

### Ubiquitous

- The system shall provide quiz locators in `robot/elements/quiz.yaml`.
- The system shall keep executable quiz scenarios under `robot/tests/quiz.robot`.

### Event-driven

- When the quiz UI is presented, the system shall answer and navigate steps via keywords that resolve quiz locators.

### State-driven

- While the user is inside the quiz flow, the system shall keep assertions and actions in quiz-scoped resources (not unrelated domain screens).

### Unwanted-behavior (must-not)

- The system shall not require BrowserStack-only locators for quiz steps that already work under the shared YAML layer.

### Optional

- Where quiz is composed after cadastro, the system may be invoked from cadastro/login journeys.

## Acceptance criteria

1. [unverified] Quiz suite exists — verified by `robot/tests/quiz.robot`.
2. [unverified] Quiz locators exist — verified by `robot/elements/quiz.yaml`.

## Maturity

**MVP (committed):**

- Quiz suite + YAML locators for current product quiz screens.

**Future (aspirational, not committed):**

- Expand coverage if new quiz variants ship in the app.

## Out of scope for this spec

- Cadastro and login surrounding the quiz.
