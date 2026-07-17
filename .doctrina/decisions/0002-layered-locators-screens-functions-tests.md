# ADR 0002 — Layered locators screens functions tests

- **Status:** accepted
- **Date:** 2026-07-17
- **Deciders:** QA / automação B3 Invest
- **Supersedes:** —
- **Superseded by:** —
- **Evidence:** `robot/elements/`, `robot/screens/`, `robot/functions/`, `robot/tests/`, `docs/README.md`
- **Landed:** —

## Context

Automação mobile da AppB3 precisa isolar seletores frágeis da lógica de fluxo e dos casos de teste. O repositório já organiza locators em YAML, ações em screens, jornadas em functions e cenários em `.robot`.

## Decision

Adotar e manter quatro camadas obrigatórias:

1. **elements** — locators YAML em `robot/elements/`
2. **screens** — interações Appium em `robot/screens/`
3. **functions** — fluxos reutilizáveis em `robot/functions/`
4. **tests** — cenários executáveis em `robot/tests/`

Shared setup fica em `robot/base.resource` e core de sessão em `resource/core/`.

## Alternatives considered

1. Locators inline nos `.robot` — acoplamento alto e manutenção cara por plataforma.
2. Page objects monolíticos sem YAML — menos portável entre Android/iOS keys.
3. Apenas functions sem screens — mistura navegação de baixo nível com regra de fluxo.

## Consequences

**Positive**

- Reuso entre suites; mudanças de UI concentram-se em YAML/screens.
- Specs de domínio podem citar camadas de forma uniforme (`ui-layers`).

**Negative**

- Mais arquivos por domínio; exige disciplina de imports.

**Neutral**

- Utilitários em `resource/utils/` complementam, sem substituir as camadas.
