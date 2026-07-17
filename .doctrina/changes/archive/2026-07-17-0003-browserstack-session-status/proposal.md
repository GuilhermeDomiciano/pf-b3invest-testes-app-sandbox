# Change 0003-browserstack-session-status — BrowserStack session status and docs

- **Status:** applied
- **Applied:** 2026-07-17
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-runtime
- **Related:** ADR 0003, ADR 0004, `docs/guia-testes.md`

## Why

Sessões App Automate não recebiam passed/failed do Robot. Faltava documentação completa de criar/executar testes (local e BS) e troubleshooting.

## What

- `Mark Browserstack Session Status` + teardown em `Close Application AppB3`
- `docs/guia-testes.md`, índice TechDocs, skill BS atualizada
- Spec `test-runtime` 0.5.0
- (Fora do requisito Doctrina, no mesmo PR de docs) `docs/melhorias-futuras.md`

## Scope boundaries

- Não implementa GitHub Actions / telemetria / IA (só listados em melhorias-futuras).
- Smoke live BS continua check manual.

## Verification

- [x] Código de status presente em `env_loader.py` + `base.resource`.
- [x] `docs/guia-testes.md` cobre setup, criar teste, local, BS, troubleshooting.
- [x] `doctrina validate` / verify / coverage no close.
- [x] Nenhum secret commitado.

## Open questions

- Nenhuma.
