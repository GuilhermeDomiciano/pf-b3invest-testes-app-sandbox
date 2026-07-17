# Tasks — Change 0004-parallel-android-ios

- [x] Criar `scripts/run_parallel_platforms.py` (Android + iOS em threads/processos).
- [x] Targets `run-parallel-bs` / `run-parallel-local` no makefile.
- [x] Preferir `DEVICE_NAME_*_BS` / `PLATFORM_VERSION_*_BS` no `env_loader`.
- [x] Atualizar `.env.example` e `docs/guia-testes.md`.
- [x] Incluir script no `verify.json` (scaffold-files).
- [x] Spec `test-runtime` 0.6.0 + delta idempotente.

## Closing steps

- [x] Apply the change: merge each delta into the corresponding spec.
- [x] Archive the change folder to `.doctrina/changes/archive/2026-07-17-0004-parallel-android-ios/`.
- [x] Update `.doctrina/index.json` with new or modified artifacts.
- [x] `doctrina validate` + `doctrina verify` + `doctrina coverage` verdes.
