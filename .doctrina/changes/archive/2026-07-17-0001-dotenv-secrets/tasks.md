# Tasks — Change 0001-dotenv-secrets

- [x] Aceitar ADR 0004 (`doctrina decision accept 4`) após revisar o texto.
- [x] Criar `.env.example` na raiz espelhando o contrato `mobile-test-runtime` + `MAILSAC_TOKEN` (valores placeholder, sem secrets reais).
- [x] Confirmar `.env` no `.gitignore`; documentar `copy .env.example .env` em `docs/README.md` e AGENTS.md.
- [x] Adicionar `python-dotenv` em `config/requirements.txt`.
- [x] Implementar loader (`resource/tools/env_loader.py` ou equivalente) + keyword de boot que popula variáveis Robot a partir do ambiente.
- [x] Integrar o loader no caminho de abertura da app (`robot/base.resource` / `resource/core/core.resource`) antes de local/BS.
- [x] Remover secrets de `config/settings.resource` e `resource/service/mailsac_service.resource` (somente defaults públicos / empty + fail-fast).
- [x] Atualizar contrato `.doctrina/contracts/mobile-test-runtime.md` (Environment + nota dotenv) e rodar `doctrina contract check`.
- [x] Aplicar deltas de spec (`test-services`, `test-runtime`) via `doctrina change apply 0001-dotenv-secrets` quando a implementação estiver pronta.
- [x] Atualizar skill `dotenv-and-secrets` se o procedimento real divergir do draft.

## Closing steps

- [x] Apply the change: merge each delta into the corresponding spec.
- [x] Archive the change folder to `.doctrina/changes/archive/YYYY-MM-DD-0001-dotenv-secrets/`.
- [x] Update `.doctrina/index.json` with new or modified artifacts.
- [x] `doctrina validate` + `doctrina verify` + `doctrina coverage` verdes.
- [x] Desbloquear implementação de `0002-browserstack-app-automate`.
