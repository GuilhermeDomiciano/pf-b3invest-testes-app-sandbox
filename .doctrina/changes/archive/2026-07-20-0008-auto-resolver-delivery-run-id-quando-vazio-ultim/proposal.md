# Change 0008 — Auto-resolve delivery_run_id

- **Status:** applied
- **Applied:** 2026-07-20
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** test-runtime

## Why

Operadores não deveriam precisar copiar o Run ID do Delivery. O valor `true` na UI era um erro recorrente; vazio + auto-resolve resolve o fluxo comum.

## What

- Step *Resolve delivery run ID* usa a API de artifacts do `b3sa/pf-b3invest-app`.
- Vazio / `latest` / `auto` / `true` → último artifact não expirado.
- Numérico → pin manual.
- Docs em `docs/guia-testes.md`.

## Scope boundaries

- Não altera o caller em `pf-b3invest-app`.
- Não escolhe build por environment/branch além do que a API de artifacts retorna (mais recentes primeiro).

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

-
