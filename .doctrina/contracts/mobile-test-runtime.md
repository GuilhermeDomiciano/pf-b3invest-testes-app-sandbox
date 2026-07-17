# Contract — mobile-test-runtime

**Contract:** mobile-test-runtime
**Status:** active
**Last updated:** 2026-07-17

## Purpose

Superfície de integração do runtime de testes mobile: Appium local, BrowserStack hub, variáveis Robot de plataforma/ambiente e caminhos de artefato da AppB3. Nenhum domínio (login, wallet, …) dono desta costura — este contrato a possui.

Segredos e overrides vêm de `.env` na raiz (ADR 0004), carregados por `resource/tools/env_loader.py` no boot (`Open AppB3`). Upload de app: `resource/tools/bs_upload_app.py`.

## Ports

| Service | Port | Protocol |
|---------|------|----------|
| Appium local | 4723 | http |
| BrowserStack cloud (hub App Automate + API upload) | 443 | https |

## Environment

| Variable | Required | Example |
|----------|----------|---------|
| PLATFORM_NAME | yes (Robot `-v` ou `.env`) | android \| ios |
| ENVIRONMENT | yes (Robot `-v` ou `.env`) | local \| bs |
| APPIUM_SERVER_LOCAL | yes (local) | http://127.0.0.1:4723 |
| APPIUM_SERVER_BS | yes (bs) | https://hub-cloud.browserstack.com/wd/hub |
| USERNAME_BS | yes (bs) — só via `.env` / env | (secret; ver `.env.example`) |
| ACESSKEY_BS | yes (bs) — só via `.env` / env | (secret; ver `.env.example`) |
| PATH_VERSIONS | yes (local app path) | ${EXECDIR}/app/ |
| ANDROID_APP_LOCAL | yes (local android) | app-cert-release.apk |
| IOS_APP_LOCAL | yes (local ios) | Runner.app |
| APP_ANDROID_BS | yes (bs android) — via `.env` / upload | bs://&lt;app-id&gt; |
| APP_IOS_BS | yes (bs ios) — via `.env` / upload | bs://&lt;app-id&gt; |
| PROJECT_NAME_BS | no (bs) | Automacao APP B3i |
| BUILD_NUMBER | no (CI) | 123 \| vazio |
| BUILD_BS | no (bs) | local-YYYYMMDD-HHmmss se vazio |
| DEVICE_NAME_BS | no (bs) | Samsung Galaxy S23 \| iPhone 15 |
| PLATFORM_VERSION_BS | no (bs) | 13.0 \| 17 |
| BS_DEBUG | no | true |
| BS_NETWORK_LOGS | no | true |
| BS_APP_PROFILING | no | true |
| APPIUM_VERSION_BS | no | 2.12.1 |
| MAILSAC_URL | no | https://mailsac.com/api |
| MAILSAC_TOKEN | yes (fluxos cadastro/e-mail) — só via `.env` / env | (secret; ver `.env.example`) |
| TAGS | no (makefile) | regressivo |

Fonte de nomes: `.env.example` (commitado) + este contrato. Arquivo `.env` é gitignored. Espelho documental opcional: `browserstack.yml.example` (não lido pelo Robot).

## Interfaces

- Onboarding env: copiar `.env.example` → `.env` e preencher secrets
- Upload app: `python resource/tools/bs_upload_app.py --file &lt;apk|ipa&gt; --platform android|ios [--update-env]`
- Makefile: `upload-bs-android` / `upload-bs-ios` (`APP_FILE=...`), `run-bs-android` / `run-bs-ios` (`LOGS_DIR`)
- Boot: keyword `Load Project Environment` em `Open AppB3` / Mailsac
- Fail-fast BS: `Validate Browserstack Secrets` + `Validate Browserstack App Id`
- Device: `Resolve Browserstack Device` (env livre ou defaults Android S23/13.0, iOS iPhone 15/17)
- Options: `Build Browserstack Options` (project, build, debug, networkLogs, appProfiling)
- Fail-fast Mailsac: `Validate Mailsac Token`
- Robot entry: `robot -v PLATFORM_NAME:&lt;os&gt; -v ENVIRONMENT:&lt;local|bs&gt; -i &lt;tag&gt; -d ./logs robot/tests/`

## References

- `specs/test-runtime`
- `specs/ui-layers`
- `specs/test-services`
- `specs/login`
- ADR 0003, ADR 0004
