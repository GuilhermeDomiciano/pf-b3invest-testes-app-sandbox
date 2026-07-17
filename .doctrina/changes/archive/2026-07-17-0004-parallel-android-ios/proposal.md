# Change 0004-parallel-android-ios — Parallel android and ios runs

- **Status:** applied
- **Applied:** 2026-07-17
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-runtime
- **Related:** ADR 0003, `docs/guia-testes.md`, `scripts/run_parallel_platforms.py`

## Why

O operador precisa validar a mesma suite em Android e iOS sem rodar duas vezes em sequência. Em BrowserStack isso economiza tempo de wall-clock (duas sessões em paralelo); localmente, o mesmo padrão vale com dois Appium.

## What

- Script `scripts/run_parallel_platforms.py` — dois processos `robot` (Android + iOS) com logs em `logs/parallel/<env>/<platform>`
- Targets makefile `run-parallel-bs` / `run-parallel-local`
- Device/version por plataforma no `.env` (`DEVICE_NAME_ANDROID_BS`, `DEVICE_NAME_IOS_BS`, etc.) via `env_loader`
- Docs em `docs/guia-testes.md` §5.3 + troubleshooting
- Spec `test-runtime` 0.6.0

## Scope boundaries

- Não usa Pabot entre plataformas (Pabot continua para tags de domínio).
- Não altera suites de domínio.
- Smoke live BS continua check manual.
- Custo BS: 2 sessões paralelas — documentado; não há throttle automático.

## Verification

- [x] `scripts/run_parallel_platforms.py` existe e aceita `--env` / `--include` / `--suite`.
- [x] Makefile e `.env.example` documentam o paralelo.
- [x] `docs/guia-testes.md` §5.3 cobre o fluxo.
- [x] Spec `test-runtime` 0.6.0 com requisito e critério de paralelo.
- [x] `doctrina validate` / verify / coverage no close.

## Open questions

- Nenhuma.
