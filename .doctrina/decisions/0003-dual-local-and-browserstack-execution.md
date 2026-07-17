# ADR 0003 — Dual local and BrowserStack execution

- **Status:** accepted
- **Date:** 2026-07-17
- **Deciders:** QA / automação B3 Invest
- **Supersedes:** —
- **Superseded by:** —
- **Evidence:** `makefile`, `resource/core/core.resource`, `resource/core/local/local.resource`, `resource/core/browserstack/browserstack.resource`, `config/settings.resource`
- **Landed:** —

## Context

Os mesmos cenários Robot precisam rodar em emulador/dispositivo local e em nuvem (BrowserStack App Automate). O core já bifurca por `ENVIRONMENT` (`local` | `bs`) e `PLATFORM_NAME` (`android` | `ios`).

## Decision

Manter **dois alvos de execução** selecionados por variáveis Robot (`PLATFORM_NAME`, `ENVIRONMENT`), orquestrados pelos targets do makefile (`run-local-*`, `run-bs-*`), com keywords de sessão em `resource/core/` e settings em `config/settings.resource`. Suites de domínio permanecem agnósticas ao alvo.

## Alternatives considered

1. Somente local — insuficiente para regressão em devices reais/nuvem.
2. Somente BrowserStack — fricção para desenvolvimento rápido de keywords.
3. Duplicar suites por ambiente — divergência e custo de manutenção.

## Consequences

**Positive**

- Um conjunto de tags/suites para local e BS.
- Makefile documenta as quatro combinações plataforma×ambiente.

**Negative**

- Credenciais BS hoje em plain text (dívida; migrar para env/secrets).
- Makefile com inconsistência `LOGS_DIR` vs `LOG_DIR`.

**Neutral**

- Binários da app (`PATH_VERSIONS` / `app/`) ficam fora do git.
