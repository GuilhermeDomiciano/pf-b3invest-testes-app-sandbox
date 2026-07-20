# Change 0006-verificar-erro-no-workflow-regression-tests-yml — Fail-fast on invalid delivery_run_id

- **Status:** proposed
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** test-runtime

## Why

O job Download Build Artifacts falhou com `Unable to download artifact(s): Not Found` porque `delivery_run_id` chegou como a string `"true"` (confundido com `upload_new_build`). A validação só checava vazio e deixava o download-artifact falhar tarde e opaco.

## What

- Endurecer o step Validate delivery run ID: exigir Run ID numérico (`^[0-9]+$`).
- Clarificar a description do input `delivery_run_id` no `workflow_dispatch`.
- Delta em `test-runtime` documentando o requisito de fail-fast.

## Scope boundaries

- Não altera o contrato de variáveis Robot (ADR 0005).
- Não corrige o run já falho; o operador deve re-disparar com o Run ID real do Delivery em `b3sa/pf-b3invest-app`.
- Não muda nomes de artifacts (`android-apk` / `ios-ipa`).

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

-
