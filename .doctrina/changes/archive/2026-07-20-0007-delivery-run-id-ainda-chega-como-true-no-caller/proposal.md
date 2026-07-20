# Change 0007-delivery-run-id-ainda-chega-como-true-no-caller — delivery_run_id ainda true

- **Status:** applied
- **Applied:** 2026-07-20
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** (chore — none)

## Why

Após o fail-fast do change 0006, o operador ainda dispara com `DELIVERY_RUN_ID: true`. O workflow está correto; o input do caller/UI continua errado. Precisa de orientação explícita no guia.

## What

- Confirmar: validação rejeitou `'true'` como esperado.
- Nenhum caller neste repo mapeia `delivery_run_id` (só `workflow_call` exposto).
- Documentar em `docs/guia-testes.md` o formato numérico e o anti-padrão `true`/`false`.

## Scope boundaries

- Não altera o YAML do workflow além do já feito em 0006.
- Não corrige o caller em `b3sa/pf-b3invest-app` (fora deste repo).

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

- Se o disparo for via `workflow_call` do app: o mapeamento em `pf-b3invest-app` precisa usar `${{ github.run_id }}`.
