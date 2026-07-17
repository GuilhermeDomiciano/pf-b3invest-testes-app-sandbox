# Spec — test-services

**Capability:** test-services
**Status:** active
**Implementation:** partial — Mailsac e fixtures ok; exclude-register é stub; credenciais hardcoded são dívida
**Realizes:** SC2, SC5
**Depends on:** test-runtime
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Oferece serviços auxiliares aos testes: fixtures de usuário, e-mail descartável (Mailsac), utilitários e gancho de exclusão de cadastro.

## Requirements (EARS)

### Ubiquitous

- The system shall provide test user fixtures in `resource/data/users.yaml`.
- The system shall provide Mailsac keywords for disposable email during registration flows.
- The system shall provide shared utilities for elements, JSON, and money regex under `resource/utils/` and `resource/tools/`.

### Event-driven

- When cadastro needs an inbox, the system shall create/read mail via Mailsac service keywords.
- When a suite requests post-registration cleanup, the system shall call exclude-register service keywords.

### State-driven

- While credentials for BrowserStack or Mailsac are required, the system shall read them from settings/resources (until migrated to environment secrets).

### Unwanted-behavior (must-not)

- The system shall not report exclude-register as a successful API deletion while the resource only logs a manual reminder.
- The system shall not commit new secrets in plain text as an accepted pattern.

### Optional

- Where a backend exclude API is delivered, the system may replace the stub implementation without changing call sites in cadastro functions.

## Acceptance criteria

1. [unverified] User fixtures exist — verified by `resource/data/users.yaml`.
2. [unverified] Mailsac service resource exists — verified by `resource/service/mailsac_service.resource`.
3. [unverified] Exclude-register stub exists — verified by `resource/service/exclude_register_service.resource`.
4. [unverified] Element/JSON/money utilities exist — verified by `resource/utils/element_utils.resource`, `resource/utils/json_utils.resource`, `resource/utils/regex_money_utils.py`.

## Maturity

**MVP (committed):**

- Fixtures + Mailsac + utils supporting current suites.
- Exclude-register hook call site (even if stubbed).

**Future (aspirational, not committed):**

- Real exclude-register HTTP API.
- Move BrowserStack/Mailsac secrets to environment variables / secret store.
- Align root README with Robot/Appium (drop Behave/Selenium/Locust claims).

## Out of scope for this spec

- Domain UI flows (login, wallet, etc.).
- Appium session lifecycle (see `test-runtime`).
