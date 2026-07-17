# Contract — mobile-test-runtime

**Contract:** mobile-test-runtime
**Status:** active
**Last updated:** 2026-07-17

## Purpose

Superfície de integração do runtime de testes mobile: Appium local, BrowserStack hub, variáveis Robot de plataforma/ambiente e caminhos de artefato da AppB3. Nenhum domínio (login, wallet, …) dono desta costura — este contrato a possui.

## Ports

| Service | Port | Protocol |
|---------|------|----------|
| Appium local | 4723 | http |
| BrowserStack hub | 443 | https |

## Environment

| Variable | Required | Example |
|----------|----------|---------|
| PLATFORM_NAME | yes (Robot `-v`) | android \| ios |
| ENVIRONMENT | yes (Robot `-v`) | local \| bs |
| APPIUM_SERVER_LOCAL | yes (local) | http://127.0.0.1:4723 |
| APPIUM_SERVER_BS | yes (bs) | https://hub-cloud.browserstack.com/wd/hub |
| USERNAME_BS | yes (bs) | set via secret / settings (do not commit new secrets) |
| ACESSKEY_BS | yes (bs) | set via secret / settings (do not commit new secrets) |
| PATH_VERSIONS | yes (local app path) | ${EXECDIR}/app/ |
| ANDROID_APP_LOCAL | yes (local android) | app-cert-release.apk |
| IOS_APP_LOCAL | yes (local ios) | Runner.app |
| APP_ANDROID_BS | yes (bs android) | bs://&lt;app-id&gt; |
| IOS_APP_BS / APP_IOS_BS | yes (bs ios) | bs://&lt;app-id&gt; |
| TAGS | no (makefile) | regressivo |

Note: names follow `config/settings.resource` as currently checked in. Prefer injecting BS credentials from the environment in future changes (see `test-services` / `test-runtime` Future).

## Interfaces

- Robot entry: `robot -v PLATFORM_NAME:&lt;os&gt; -v ENVIRONMENT:&lt;local|bs&gt; -i &lt;tag&gt; -d &lt;logs&gt; robot/tests/`
- Makefile targets: `run-local-android`, `run-local-ios`, `run-bs-android`, `run-bs-ios`
- Session keywords: `resource/core/core.resource` delegates to `local/` or `browserstack/`
- Parallel: `pabot` with domain tags (e.g. `-i gmud`) over `robot/tests/`

## References

- `specs/test-runtime`
- `specs/ui-layers`
- `specs/test-services`
- `specs/login`
