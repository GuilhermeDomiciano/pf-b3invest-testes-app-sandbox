# Change 0005-github-actions-regression — GitHub Actions regression workflow

- **Status:** applied
- **Applied:** 2026-07-17
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-runtime
- **Related:** ADR 0005, `.github/workflows/regression-tests.yml`

## Why

Pipeline GHA de regressão mobile alinhado ao runtime local, com upload via delivery e suporte a `cer|dev|prd` como GitHub Environment.

## What

- Reescrita de `.github/workflows/regression-tests.yml` ao contrato `PLATFORM_NAME` / `ENVIRONMENT=bs` / `APP_*_BS` / `USERNAME_BS`
- Upload via `scripts/bs_upload_app.py` + artifacts `android-apk` / `ios-ipa` do delivery
- Análise IA comentada (change futura)
- ADR 0005 accepted + landed
- Spec `test-runtime` 0.7.0 + docs §7

## Scope boundaries

- Sem implementar `analyze_robot_results.py`
- Sem alterar suites de domínio
- Nomes de artifact/repo delivery confirmados pelo humano

## Verification

- [x] Assessment e decisões do humano registrados.
- [x] Workflow adaptado ao contrato atual.
- [x] ADR 0005 + docs guia.
- [x] `doctrina validate` / verify / coverage no close.

## Open questions

- Nenhuma (YAML do delivery não foi necessário — nomes confirmados).
