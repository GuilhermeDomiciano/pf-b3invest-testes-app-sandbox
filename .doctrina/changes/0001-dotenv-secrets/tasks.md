# Tasks — Change 0001-dotenv-secrets

- [ ] Aceitar ADR 0004 (`doctrina decision accept 4`) após revisar o texto.
- [ ] Criar `.env.example` na raiz espelhando o contrato `mobile-test-runtime` + `MAILSAC_TOKEN` (valores placeholder, sem secrets reais).
- [ ] Confirmar `.env` no `.gitignore`; documentar `copy .env.example .env` em `docs/README.md` e AGENTS.md.
- [ ] Adicionar `python-dotenv` em `config/requirements.txt`.
- [ ] Implementar loader (`resource/tools/env_loader.py` ou equivalente) + keyword de boot que popula variáveis Robot a partir do ambiente.
- [ ] Integrar o loader no caminho de abertura da app (`robot/base.resource` / `resource/core/core.resource`) antes de local/BS.
- [ ] Remover secrets de `config/settings.resource` e `resource/service/mailsac_service.resource` (somente defaults públicos / empty + fail-fast).
- [ ] Atualizar contrato `.doctrina/contracts/mobile-test-runtime.md` (Environment + nota dotenv) e rodar `doctrina contract check`.
- [ ] Aplicar deltas de spec (`test-services`, `test-runtime`) via `doctrina change apply 0001-dotenv-secrets` quando a implementação estiver pronta.
- [ ] Atualizar skill `dotenv-and-secrets` se o procedimento real divergir do draft.

## Closing steps

- [ ] Apply the change: merge each delta into the corresponding spec.
- [ ] Archive the change folder to `.doctrina/changes/archive/YYYY-MM-DD-0001-dotenv-secrets/`.
- [ ] Update `.doctrina/index.json` with new or modified artifacts.
- [ ] `doctrina validate` + `doctrina verify` + `doctrina coverage` verdes.
- [ ] Desbloquear implementação de `0002-browserstack-app-automate`.
