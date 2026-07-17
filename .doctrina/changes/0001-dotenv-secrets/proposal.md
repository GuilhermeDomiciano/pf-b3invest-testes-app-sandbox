# Change 0001-dotenv-secrets — Dotenv secrets and project env

- **Status:** proposed
- **Date:** 2026-07-17
- **Owner:** QA / automação B3 Invest
- **Affects specs:** test-services, test-runtime
- **Depends on:** —
- **Blocks:** 0002-browserstack-app-automate
- **Related:** ADR 0004, contract `mobile-test-runtime`, skill `dotenv-and-secrets`

## Why

Credenciais BrowserStack e Mailsac estão em plain text em `config/settings.resource` e `resource/service/mailsac_service.resource`. Para rodar suites no BrowserStack App Automate com boa prática, o projeto precisa de `.env` (local, gitignored) + `.env.example` (commitado) e carregamento das variáveis no Robot sem hardcode.

## What

- Introduzir `.env.example` na raiz com todas as chaves do contrato (BS, Mailsac, apps, defaults não secretos).
- Garantir `.env` gitignored (já listado) e documentar cópia a partir do example.
- Adicionar loader (python-dotenv + keyword/library) que injeta env → variáveis Robot antes da sessão.
- Remover valores secretos dos resources versionados (placeholders ou leitura só via env).
- Atualizar contrato `mobile-test-runtime` e deltas de `test-services` / `test-runtime`.
- Documentar o fluxo em `docs/` / AGENTS.md.

## Scope boundaries

- Não altera capabilities de domínio (login, wallet, …) nem locators.
- Não sobe apps para o BrowserStack (feito em 0002).
- Não implementa CI secrets store (só dotenv local + example).
- Não cria pasta `.env/` — usa **arquivo** `.env` na raiz (padrão dotenv). Se no futuro houver múltiplos profiles, preferir `.env.local` / `.env.bs` gitignored, não um diretório versionado de segredos.

## Verification

- [ ] Automated checks pass (`doctrina verify`).
- [ ] `doctrina coverage` e `doctrina contract check` verdes após apply.
- [ ] Nenhum secret real permanece em `config/settings.resource` / `mailsac_service.resource` (grep).
- [ ] Com `.env` preenchido, variáveis BS/Mailsac resolvem no Robot; sem `.env`, falha clara (não valor vazio silencioso).
- [ ] `.env.example` commitado; `.env` ausente do git.

## Open questions

- Confirmar se o time prefere um único `.env` na raiz (proposta) vs `config/.env` — default: **raiz**, alinhado ao `.gitignore` existente.
