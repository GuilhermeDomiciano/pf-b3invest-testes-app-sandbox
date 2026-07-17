# Contract — mobile-test-runtime

**Contract:** mobile-test-runtime
**Status:** active
**Last updated:** 2026-07-17

## Purpose

Superfície de integração do runtime de testes mobile: Appium local, BrowserStack hub, variáveis Robot de plataforma/ambiente e caminhos de artefato da AppB3. Nenhum domínio (login, wallet, …) dono desta costura — este contrato a possui.

Segredos e overrides vêm de `.env` na raiz (ADR 0004), carregados por `resource/tools/env_loader.py` no boot (`Open AppB3`).

## Ports

| Service | Port | Protocol |
|---------|------|----------|
| Appium local | 4723 | http |
| BrowserStack hub | 443 | https |

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
| APP_ANDROID_BS | yes (bs android) — via `.env` | bs://&lt;app-id&gt; |
| APP_IOS_BS | yes (bs ios) — via `.env` | bs://&lt;app-id&gt; |
| PROJECT_NAME_BS | no (bs) | B3_APP |
| BUILD_BS | no (bs) | REGRESSION_ANDROID |
| MAILSAC_URL | no | https://mailsac.com/api |
| MAILSAC_TOKEN | yes (fluxos cadastro/e-mail) — só via `.env` / env | (secret; ver `.env.example`) |
| TAGS | no (makefile) | regressivo |

Fonte de nomes: `.env.example` (commitado) + este contrato. Arquivo `.env` é gitignored e não deve ser versionado.

## Interfaces

- Onboarding env: copiar `.env.example` → `.env` e preencher secrets
- Boot: keyword `Load Project Environment` em `Open AppB3` / Mailsac
- Fail-fast BS: `Validate Browserstack Secrets` + `Validate Browserstack App Id`
- Fail-fast Mailsac: `Validate Mailsac Token`
- Robot entry: `robot -v PLATFORM_NAME:&lt;os&gt; -v ENVIRONMENT:&lt;local|bs&gt; -i &lt;tag&gt; -d &lt;logs&gt; robot/tests/`
- Makefile targets: `run-local-android`, `run-local-ios`, `run-bs-android`, `run-bs-ios`
- Session keywords: `resource/core/core.resource` delega para `local/` ou `browserstack/`
- Parallel: `pabot` com tags de domínio (ex.: `-i gmud`) sobre `robot/tests/`

## References

- `specs/test-runtime`
- `specs/ui-layers`
- `specs/test-services`
- `specs/login`
- ADR 0004
