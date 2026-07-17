# Change 0002-browserstack-app-automate — BrowserStack App Automate suites

- **Status:** proposed
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-runtime
- **Depends on:** 0001-dotenv-secrets
- **Related:** ADR 0003, ADR 0004, contract `mobile-test-runtime`, skill `browserstack-app-automate-run`

## Why

O core e o makefile já expõem `ENVIRONMENT:bs`, mas as suites ainda não estão operacionalizadas de ponta a ponta no BrowserStack App Automate com boas práticas: app ids via env, makefile corrigido, docs e prova de execução. Esta change habilita rodar os testes existentes na nuvem **depois** que os segredos saírem do git (0001).

## What

- Garantir que `run-bs-android` / `run-bs-ios` usem logs corretos (`LOGS_DIR` vs `LOG_DIR`) e variáveis vindas do `.env`.
- Validar/ajustar capabilities em `resource/core/browserstack/` (project/build/session, app ids `bs://…`).
- Documentar upload do APK/IPA no BS App Automate e preenchimento de `APP_ANDROID_BS` / `APP_IOS_BS` no `.env`.
- Confirmar que suites sob `robot/tests/` (tag `regressivo` ou domínio) abrem AppB3 em BS sem alteração de domínio.
- Atualizar docs + skill de execução BS; sign-off do check manual de verify quando aplicável.

## Scope boundaries

- Não implementa 0001 (dotenv) — **bloqueada até 0001 arquivada**.
- Não reescreve suites de domínio nem locators.
- Não adiciona CI GitHub Actions (fora do repo / desconhecido).
- Não versiona APK/IPA no git.

## Verification

- [ ] Automated checks pass (`doctrina verify`).
- [ ] `doctrina coverage` / `doctrina contract check` verdes.
- [ ] `make run-bs-android` (e/ou ios) com `.env` válido abre sessão BS e executa ao menos uma suite smoke (ex. tag `login` ou `home`).
- [ ] Sem `.env` / sem app id, a falha é explícita antes de hang no hub.
- [ ] Nenhum secret novo commitado.

## Open questions

- Quais `bs://` app ids oficiais do time (Android/iOS) usar no `.env` de cada pessoa — fora do git; documentar só o processo de upload.
- Device/OS matrix no BS: manter wildcards atuais (`Samsung Galaxy S.*`, `iPhone.*`) ou pinar modelos — default: **manter wildcards** até o time pedir pin.
