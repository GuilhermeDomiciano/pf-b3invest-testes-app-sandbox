# Change 0010 — delivery_repo = pf-b3invest-app-base

- **Status:** applied
- **Applied:** 2026-07-20
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** test-runtime

## Why

Artifacts `android-apk` / `ios-ipa` nascem no run do caller `b3sa/pf-b3invest-app-base` (*Pipeline - Deploy CERT* → `workflow-flutter-delivery-cert.yml`). O default antigo (`pf-b3invest-app`) gerava HTTP 404.

## What

- Default `delivery_repo` → `b3sa/pf-b3invest-app-base`.
- Docs + mensagem 404 alinhados ao fluxo Flutter Deploy CERT.

## Scope boundaries

- Não altera o reusable workflow em `pf-b3invest-reusable-workflows`.
- Não garante que o PAT já tenha acesso a `app-base` (operacional).

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

-
