# ADR 0005 — CI uses same Robot variable contract as local

- **Status:** accepted
- **Date:** 2026-07-17
- **Deciders:** QA / automação B3 Invest
- **Supersedes:** —
- **Superseded by:** —
- **Evidence:** `.github/workflows/regression-tests.yml`, `.env.example`, `resource/tools/env_loader.py`, ADR 0004
- **Landed:** 2026-07-17 — `.github/workflows/regression-tests.yml`, `.env.example`, `resource/tools/env_loader.py`

## Context

Uma proposta de GitHub Actions usava outro contrato (`APP_URL`, `PLATFORM`, `ENVIRONMENT=cer`, paths `tests/mobile/`). O runtime local já estabilizou `PLATFORM_NAME`, `ENVIRONMENT=local|bs`, `USERNAME_BS`/`ACESSKEY_BS`, `APP_*_BS`. Adaptar o Robot ao YAML antigo quebraria o trabalho das changes 0001–0004. O CI precisa falar a mesma língua do makefile/scripts locais.

## Decision

O pipeline GitHub Actions (e qualquer `workflow_call` do delivery) **deve** usar o mesmo contrato de variáveis do runtime local:

- Robot: `PLATFORM_NAME` (`android`|`ios`), `ENVIRONMENT=bs` (nunca `cer`/`dev`/`prd` no Robot)
- Secrets mapeados: GHA `BROWSERSTACK_USERNAME`/`BROWSERSTACK_ACCESS_KEY` → `.env` `USERNAME_BS`/`ACESSKEY_BS`
- App ids: `APP_ANDROID_BS` / `APP_IOS_BS` (`bs://...`)
- Devices: `DEVICE_NAME_*_BS` / `PLATFORM_VERSION_*_BS`
- Suites: `robot/tests/`; deps: `config/requirements.txt`; logs: `logs/ci/<platform>/`
- Upload: `scripts/bs_upload_app.py`
- `cer`|`dev`|`prd` = GitHub Environment + rótulo `BUILD_BS` / `BUILD_NUMBER`, não o target Appium

## Alternatives considered

1. **Adaptar Robot ao contrato do YAML antigo** — rejeitado: duplicaria conceitos e quebraria o fluxo local.
2. **Camada de tradução no CI só** (aliases) — rejeitado para MVP: dois nomes para a mesma coisa aumenta drift; preferir um contrato.
3. **Não versionar CI ainda** — rejeitado: o delivery já precisa chamar este repo.

## Consequences

**Positive**

- Um só mental model local ↔ CI
- Reuso de `bs_upload_app.py` e `env_loader.py`
- Falhas de teste falham o job (sem `robot || true`)

**Negative**

- Secrets no GitHub org ainda usam nomes BrowserStack “canônicos”; o job traduz para `*_BS`
- Análise IA fica comentada até outra change

**Neutral**

- Cross-repo artifacts (`android-apk` / `ios-ipa` em `b3sa/pf-b3invest-app`) permanecem responsabilidade do delivery
