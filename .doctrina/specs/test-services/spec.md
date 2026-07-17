# Spec — test-services

**Capability:** test-services
**Status:** active
**Implementation:** partial — dotenv loader + removal of hardcoded secrets (change 0001)
**Realizes:** SC2, SC5
**Depends on:** test-runtime
**Last updated:** 2026-07-17
**Version:** 0.3.0

## Purpose

Oferece serviços auxiliares aos testes: fixtures de usuário, e-mail descartável (Mailsac), utilitários e gancho de exclusão de cadastro.

## Requirements (EARS)

### Ubiquitous

- The system shall provide test user fixtures in `resource/data/users.yaml`.
- The system shall provide Mailsac keywords for disposable email during registration flows.
- The system shall provide shared utilities for elements, JSON, and money regex under `resource/utils/` and `resource/tools/`.
- The system shall load project secrets and environment-specific values from a root `.env` file (via dotenv) into Robot variables at suite boot.
- The system shall ship a committed `.env.example` that enumerates every required key with non-secret placeholders.

### Event-driven

- When cadastro needs an inbox, the system shall create/read mail via Mailsac service keywords.
- When a suite requests post-registration cleanup, the system shall call exclude-register service keywords.
- When a required secret is missing for the active `ENVIRONMENT`, the system shall fail fast with an explicit error before opening an Appium session.

### State-driven

- While credentials for BrowserStack or Mailsac are required, the system shall read them from the process environment / `.env` (never from committed plain-text tokens in resource files).

### Unwanted-behavior (must-not)

- The system shall not report exclude-register as a successful API deletion while the resource only logs a manual reminder.
- The system shall not commit new secrets in plain text as an accepted pattern.
- The system shall not commit a real `.env` file or real secret values inside `.env.example`.

### Optional

- Where a backend exclude API is delivered, the system may replace the stub implementation without changing call sites in cadastro functions.

## Acceptance criteria

1. [unverified] User fixtures exist — verified by `resource/data/users.yaml`.
2. [unverified] Mailsac service resource exists — verified by `resource/service/mailsac_service.resource`.
3. [unverified] Exclude-register stub exists — verified by `resource/service/exclude_register_service.resource`.
4. [unverified] Element/JSON/money utilities exist — verified by `resource/utils/element_utils.resource`, `resource/utils/json_utils.resource`, `resource/utils/regex_money_utils.py`.
5. [unverified] Secrets for BrowserStack and Mailsac are loaded from environment / `.env`, not committed in resources — verified by `resource/tools/env_loader.py`, `.env.example`
6. [unverified] `.env.example` lists required keys without real secret values — verified by `.env.example`

## Maturity

**MVP (committed):**

- Fixtures + Mailsac + utils supporting current suites.
- Exclude-register hook call site (even if stubbed).
- Dotenv (`.env` / `.env.example`) for BrowserStack and Mailsac secrets (ADR 0004).

**Future (aspirational, not committed):**

- Real exclude-register HTTP API.
- Align root README with Robot/Appium (drop Behave/Selenium/Locust claims).

## Out of scope for this spec

- Domain UI flows (login, wallet, etc.).
- Appium session lifecycle (see `test-runtime`).
