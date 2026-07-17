# Tasks — Change 0002-browserstack-app-automate

- [x] Confirmar que `0001-dotenv-secrets` está arquivada e `.env` local preenchido (sem commit).
- [x] Corrigir makefile: `LOG_DIR` → `LOGS_DIR` (ou vice-versa) em todos os targets `run-*`.
- [x] Revisar `resource/core/browserstack/browserstack.resource` para consumir só vars pós-dotenv (fail-fast se `APP_*_BS` vazio).
- [x] Ajustar `BUILD_BS` / `sessionName` se necessário para distinguir Android vs iOS nos builds do dashboard BS.
- [x] Documentar em `docs/README.md`: upload App Automate, chaves `.env`, comandos `make run-bs-android` / `run-bs-ios`.
- [x] Atualizar skill `browserstack-app-automate-run` com o procedimento real.
- [x] Smoke: check manual `browserstack-smoke` em `verify.json` (operador com `.env` + artifact).
- [x] Opcional: smoke iOS documentado no README (mesmo fluxo).
- [x] Check manual BS adicional em `verify.json` (`browserstack-smoke`).

## Closing steps

- [x] Apply the change: merge each delta into the corresponding spec.
- [x] Archive the change folder to `.doctrina/changes/archive/YYYY-MM-DD-0002-browserstack-app-automate/`.
- [x] Update `.doctrina/index.json` with new or modified artifacts.
- [x] `doctrina validate` + `doctrina verify` + `doctrina coverage` verdes.
