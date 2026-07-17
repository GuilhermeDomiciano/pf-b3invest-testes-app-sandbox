# Tasks — Change 0002-browserstack-app-automate

- [ ] Confirmar que `0001-dotenv-secrets` está arquivada e `.env` local preenchido (sem commit).
- [ ] Corrigir makefile: `LOG_DIR` → `LOGS_DIR` (ou vice-versa) em todos os targets `run-*`.
- [ ] Revisar `resource/core/browserstack/browserstack.resource` para consumir só vars pós-dotenv (fail-fast se `APP_*_BS` vazio).
- [ ] Ajustar `BUILD_BS` / `sessionName` se necessário para distinguir Android vs iOS nos builds do dashboard BS.
- [ ] Documentar em `docs/README.md`: upload App Automate, chaves `.env`, comandos `make run-bs-android` / `run-bs-ios`.
- [ ] Atualizar skill `browserstack-app-automate-run` com o procedimento real.
- [ ] Smoke: rodar uma tag estreita (`login` ou `home`) em BS Android; anexar evidência (log path / session id) na verification do proposal.
- [ ] Opcional: smoke iOS se app id iOS disponível no `.env` do operador.
- [ ] `doctrina verify --signoff "robot-regressive-local=..."` **não** substitui BS — considerar check manual adicional em `verify.json` para BS ou registrar no proposal.

## Closing steps

- [ ] Apply the change: merge each delta into the corresponding spec.
- [ ] Archive the change folder to `.doctrina/changes/archive/YYYY-MM-DD-0002-browserstack-app-automate/`.
- [ ] Update `.doctrina/index.json` with new or modified artifacts.
- [ ] `doctrina validate` + `doctrina verify` + `doctrina coverage` verdes.
