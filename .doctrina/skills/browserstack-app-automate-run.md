---
name: browserstack-app-automate-run
description: Executar as suites Robot existentes no BrowserStack App Automate via makefile, dotenv e upload de app (bs_upload_app.py).
when: O agente precisa rodar, depurar ou configurar ENVIRONMENT=bs / make run-bs-* / upload de APK-IPA, ou trabalha na change 0002-browserstack-app-automate.
---

# Skill — browserstack-app-automate-run

## When to use this skill

- Ao rodar ou corrigir `make run-bs-android` / `make run-bs-ios`.
- Ao configurar `APP_ANDROID_BS` / `APP_IOS_BS`, devices ou capabilities BS.
- Ao fazer upload do artifact do GitHub Actions para o App Automate.
- Quando o usuário pedir para “rodar no BrowserStack” as suites de `robot/tests/`.

## Procedure

1. Confirmar `.env` com `USERNAME_BS` e `ACESSKEY_BS` (skill `dotenv-and-secrets`). Nunca commitar.
2. Baixar APK/IPA do artifact do GHA (ou path local).
3. Upload e gravação do `bs://` (**sem** `python -m`):
   ```
   python scripts/bs_upload_app.py --file ./app/app.apk --platform android --update-env
   # ou make upload-bs-android APP_FILE=./app/app.apk
   ```
   Se aparecer `ModuleNotFoundError` com `resource/tools/...`, ver skill `python-run-project-scripts`.
4. (Opcional) `DEVICE_NAME_BS` + `PLATFORM_VERSION_BS` no `.env`. Defaults: S23/13.0 ou iPhone 15/17.
5. Smoke:
   ```
   make run-bs-android TAGS=login
   ```
6. Confirmar logs em `./logs` (`LOGS_DIR` no makefile).
7. Não bifurcar suites para BS; não usar BrowserStack SDK / `browserstack.yml` na execução (só `.example` documental).

## Anti-patterns

- Commitar `bs://`, userName ou accessKey.
- Executar via `browserstack.yml` / SDK em vez de Robot + dotenv.
- Duplicar testes em `*_bs.robot`.
- Rodar `regressivo` completo no BS como primeira validação.

## Related material

- ADR 0003, ADR 0004
- `resource/tools/bs_upload_app.py`, `resource/core/browserstack/browserstack.resource`
- `browserstack.yml.example`, `docs/README.md`
- Contrato `mobile-test-runtime`
