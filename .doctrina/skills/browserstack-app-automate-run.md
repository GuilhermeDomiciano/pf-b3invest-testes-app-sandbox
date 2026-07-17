---
name: browserstack-app-automate-run
description: Executar as suites Robot existentes no BrowserStack App Automate via makefile e credenciais/app ids do dotenv.
when: O agente precisa rodar, depurar ou configurar ENVIRONMENT=bs / make run-bs-* / sessões App Automate, ou trabalha na change 0002-browserstack-app-automate.
---

# Skill — browserstack-app-automate-run

## When to use this skill

- Ao rodar ou corrigir `make run-bs-android` / `make run-bs-ios`.
- Ao configurar `APP_ANDROID_BS` / `APP_IOS_BS` (`bs://…`) ou capabilities BS.
- Ao implementar a change `0002-browserstack-app-automate`.
- Quando o usuário pedir para “rodar no BrowserStack” as suites de `robot/tests/`.

## Procedure

1. Confirmar que a change `0001-dotenv-secrets` está concluída (ou que o loader já existe). Carregar a skill `dotenv-and-secrets` se for mexer em credenciais.
2. Garantir que o `.env` local tenha pelo menos:
   - `USERNAME_BS`, `ACESSKEY_BS`
   - `APP_ANDROID_BS` e/ou `APP_IOS_BS`
   - opcional: `PROJECT_NAME_BS`, `BUILD_BS`
3. Fazer upload do binário AppB3 no dashboard/API do BrowserStack App Automate; copiar o id `bs://` para o `.env` (nunca commitiar).
4. Smoke (tag estreita primeiro):
   ```
   make run-bs-android
   # ou
   robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i login -d ./logs robot/tests/
   ```
5. Confirmar que os logs caem em `./logs` (makefile com `LOGS_DIR` consistente).
6. **Não** bifurcar suites de domínio para BS — mesmos `.robot` (ADR 0003).
7. Preferir smoke serial antes de `pabot` no BS (custo de device-minute).
8. Em falha: checar auth no hub, validade do app id, mismatch de plataforma (apk android vs app ios) e depois capabilities em `resource/core/browserstack/`.

## Anti-patterns

- Commitar ids `bs://` específicos da conta no git “por conveniência”.
- Usar BrowserStack SDK / `browserstack.yaml` / caminho Behave do README raiz desatualizado.
- Duplicar testes em `*_bs.robot`.
- Rodar o `regressivo` completo no BS como primeira validação após mudar credenciais.

## Related material

- ADR 0003 — Execução dual local e BrowserStack
- ADR 0004 — Segredos via dotenv
- Change `.doctrina/changes/0002-browserstack-app-automate/`
- Spec `test-runtime`
- `makefile`, `resource/core/browserstack/browserstack.resource`
