# Change 0002-browserstack-app-automate — BrowserStack App Automate suites

- **Status:** applied
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-runtime
- **Depends on:** 0001-dotenv-secrets
- **Related:** ADR 0003, ADR 0004, contract `mobile-test-runtime`, skill `browserstack-app-automate-run`

## Why

Habilitar suites Robot existentes para BrowserStack App Automate (Android/iOS): app ids via upload API, capabilities (device/build/flags), makefile `run-bs-*` com `LOGS_DIR`, docs e espelho `browserstack.yml.example` — sem segredos no git.

## What

- Makefile com `LOGS_DIR` consistente + targets `upload-bs-*`.
- Caps BS em `browserstack.resource` + `env_loader` (device livre, build fallback, debug/network/profiling).
- Script `bs_upload_app.py` (API App Automate → `bs://`).
- `.env.example`, contrato, `docs/README.md`, `browserstack.yml.example`.
- Spec `test-runtime` 0.4.0.

## Scope boundaries

- Credenciais preenchidas pelo operador no `.env` (não commitadas).
- Smoke live BS fica como check manual em `verify.json` (`browserstack-smoke`).
- Pipeline GHA que gera o APK permanece fora deste repo; aqui só o consumo do artifact via upload.

## Verification

- [x] Automated checks pass (`doctrina verify` — checks automáticos).
- [x] `doctrina coverage` / `doctrina contract check` (após close).
- [x] Smoke live BS: gate manual `browserstack-smoke` em `verify.json` (operador após preencher `.env` + upload) — fora do escopo de CI deste close.
- [x] Sem `.env` / sem app id, falha explícita (`Validate Browserstack*`).
- [x] Nenhum secret novo commitado.

## Open questions

- Nenhuma — decisões do operador registradas (Robot/dotenv, devices, upload script, BUILD fallback).
