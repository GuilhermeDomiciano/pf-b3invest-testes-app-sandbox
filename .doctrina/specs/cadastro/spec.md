# Spec — cadastro

**Capability:** cadastro
**Status:** active
**Implementation:** partial — exclusão de cadastro via API ainda é stub/lembrete em log
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, test-services
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza o fluxo de cadastro de usuário na AppB3, incluindo suporte a e-mail de teste e limpeza/exclusão quando disponível.

## Requirements (EARS)

### Ubiquitous

- The system shall provide cadastro screen keywords and flow functions with locators in `robot/elements/cadastro.yaml`.
- The system shall keep executable cadastro scenarios under `robot/tests/cadastro.robot`.

### Event-driven

- When a registration flow needs a disposable inbox, the system shall use the Mailsac auxiliary service keywords.
- When a test finishes a registration that must be cleaned up, the system shall invoke the exclude-register service hook (until a real backend API is wired).

### State-driven

- While the app is on the cadastro screens, the system shall drive field fill and navigation through cadastro screen keywords.

### Unwanted-behavior (must-not)

- The system shall not silently claim account deletion succeeded when only a log reminder was emitted.

### Optional

- Where backend exclude-register API becomes available, the system may replace the stub with a real HTTP cleanup call.

## Acceptance criteria

1. [unverified] Cadastro suite exists — verified by `robot/tests/cadastro.robot`.
2. [unverified] Screen, functions, and YAML exist — verified by `robot/screens/cadastro/cadastro_screen.resource`, `robot/functions/cadastro/cadastro_functions.resource`, `robot/elements/cadastro.yaml`.
3. [unverified] Exclude-register stub is present and documented as incomplete — verified by `resource/service/exclude_register_service.resource`.

## Maturity

**MVP (committed):**

- Cadastro happy-path automation with layered resources.
- Mailsac integration for test email.

**Future (aspirational, not committed):**

- Real exclude-register backend API integration.
- Full cleanup guarantees after every registration run.

## Out of scope for this spec

- Login after registration (see `login`).
- Quiz pós-cadastro (see `quiz`).
