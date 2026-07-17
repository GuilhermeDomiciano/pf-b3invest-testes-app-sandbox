---
name: dotenv-and-secrets
description: Carregar e manter segredos do projeto via .env / .env.example na raiz, sem versionar credenciais em resources Robot.
when: O agente toca credenciais BrowserStack/Mailsac, settings.resource, variáveis de ambiente, arquivos .env, a change 0001-dotenv-secrets ou a ADR 0004.
---

# Skill — dotenv-and-secrets

## When to use this skill

- Ao adicionar ou renomear variável de ambiente usada pelo Robot/Appium.
- Ao editar `config/settings.resource`, `mailsac_service.resource` ou o core BS.
- Ao implementar ou revisar a change `0001-dotenv-secrets`.
- Ao suspeitar que um segredo foi commitado ou ao ser pedido para “colocar o token no resource”.

## Procedure

1. Ler a ADR 0004 e a tabela Environment do contrato `mobile-test-runtime`.
2. Incluir a nova chave em **ambos** `.env.example` (placeholder) e a tabela do contrato na mesma change.
3. Ligar a chave em `resource/tools/env_loader.py` (`ENV_KEYS`) → variável Robot (manter o nome atual quando possível, ex.: `USERNAME_BS`, `ACESSKEY_BS`, `MAILSAC_TOKEN`).
4. Nunca gravar valores reais de segredo em:
   - arquivos commitados `*.resource` / `*.robot` / `*.yaml`
   - `.env.example`
   - textos de proposal/design/spec
5. Garantir que `.env` continue no `.gitignore`; verificar com `git status` / `git check-ignore -v .env`.
6. Fail-fast: `Validate Browserstack Secrets` / `Validate Browserstack App Id` / `Validate Mailsac Token` (keywords do loader).
7. Boot: `Load Project Environment` é chamado em `Open AppB3` (`resource/core/core.resource`).
8. Rodar `doctrina contract check` após editar o contrato; `doctrina validate` antes de fechar.

## Anti-patterns

- Colar access keys do BrowserStack ou tokens Mailsac em respostas de chat ou commits.
- Criar pasta versionada `.env/` cheia de credenciais reais.
- Hardcode “temporário” em `settings.resource` “só para local”.
- Atualizar `.env.example` sem atualizar o contrato (ou o inverso).

## Related material

- ADR 0004 — Segredos e config via dotenv, não em resources
- Contrato `.doctrina/contracts/mobile-test-runtime.md`
- Change `.doctrina/changes/0001-dotenv-secrets/`
- Specs `test-services`, `test-runtime`
