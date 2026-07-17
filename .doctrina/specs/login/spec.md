# Spec — login

**Capability:** login
**Status:** active
**Implementation:** implemented
**Realizes:** SC1, SC5
**Depends on:** test-runtime, ui-layers, test-services
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza autenticação na AppB3 (CPF/CNPJ e fluxos de entrada) para que suites de domínio partam de um usuário autenticado de forma repetível.

## Requirements (EARS)

### Ubiquitous

- The system shall provide login screen keywords backed by `robot/elements/login.yaml`.
- The system shall provide login flow functions reusable by other suites.
- The system shall load test user credentials from fixture data (`resource/data/users.yaml`) rather than inventing credentials inside each test.

### Event-driven

- When a suite requires an authenticated session, the system shall execute the login flow keywords to reach the post-login home state.
- When login UI elements are presented, the system shall interact via login screen keywords (not ad-hoc locators in the test).

### State-driven

- While the app shows the login surface, the system shall expose keywords to fill identity fields and submit credentials.

### Unwanted-behavior (must-not)

- The system shall not hardcode production user secrets inside `.robot` suites when fixtures exist.

### Optional

- Where walkthrough/onboarding appears before login completes, the system may compose with `walkthrough` keywords.

## Acceptance criteria

1. [unverified] Login suite exists and is executable under `robot/tests/` — verified by `robot/tests/login.robot`.
2. [unverified] Login screen and functions resources exist — verified by `robot/screens/login/login_screen.resource`, `robot/functions/login/login_functions.resource`.
3. [unverified] Locators live in YAML — verified by `robot/elements/login.yaml`.

## Maturity

**MVP (committed):**

- Login suite + screen + functions + YAML locators.
- Fixture-driven users for happy-path auth.

**Future (aspirational, not committed):**

- Broader negative-path coverage (invalid CPF, locked account) if product requires it.

## Out of scope for this spec

- Cadastro / criação de conta (see `cadastro`).
- Session/device provisioning (see `test-runtime`).
