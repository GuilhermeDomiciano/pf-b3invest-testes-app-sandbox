# ADR 0004 — Secrets and config via dotenv not in resources

- **Status:** accepted
- **Date:** 2026-07-17
- **Deciders:** QA / automação B3 Invest
- **Supersedes:** —
- **Superseded by:** —
- **Evidence:** n/a — awaiting change 0001-dotenv-secrets implementation
- **Landed:** —

## Context

Username/access key BrowserStack e token Mailsac estão versionados em plain text. O product.md declara non-goal de não armazenar segredos assim. Para habilitar BrowserStack App Automate com segurança operacional, é preciso um padrão único de configuração local/CI.

## Decision

Adotar **dotenv na raiz do repositório**:

- `.env` — valores reais, **nunca** commitados (já no `.gitignore`).
- `.env.example` — catálogo de chaves com placeholders, **sempre** commitado.
- Carregamento via `python-dotenv` (ou equivalente) no boot Robot, mapeando env → variáveis usadas por `settings` / core / services.
- Resources versionados guardam apenas defaults não secretos (URLs públicas, nomes de projeto/build).

Não usar pasta versionada `.env/` de secrets. Profiles extras, se necessários, são arquivos gitignored adicionais (ex. `.env.bs`), não artefatos no git.

## Alternatives considered

1. Secrets só em CI / secret manager sem `.env.example` — onboarding local pior.
2. Pasta `.env/` commitada — alto risco de vazamento.
3. Manter secrets em `*.resource` — viola non-goal e aumenta risco no git history.
4. BrowserStack SDK config files com credenciais — fora da stack Robot (ADR 0001).

## Consequences

**Positive**

- Alinha contrato `mobile-test-runtime`, non-goal do product e execução BS.
- Onboarding: copiar `.env.example` → `.env`.

**Negative**

- Boot precisa chamar o loader explicitamente.
- Histórico git ainda pode conter secrets antigos (rotação recomendada fora desta ADR).

**Neutral**

- Nome legado `ACESSKEY_BS` permanece até rename coordenado.
