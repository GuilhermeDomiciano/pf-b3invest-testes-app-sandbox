# ADR 0001 — Robot Framework and Appium as mobile test stack

- **Status:** accepted
- **Date:** 2026-07-17
- **Deciders:** QA / automação B3 Invest (squad owner Backstage)
- **Supersedes:** —
- **Superseded by:** —
- **Evidence:** `config/requirements.txt`, `robot/`, `resource/core/`, `docs/README.md`
- **Landed:** —

## Context

O README raiz ainda cita Behave, Selenium e Locust, mas o código versionado é Robot Framework + Appium (AppiumLibrary, suites `.robot`, drivers UiAutomator2/XCUITest). O intake e o Backstage descrevem automação mobile da AppB3. É preciso fixar a stack real para agents e contribuidores não seguirem a documentação desatualizada.

## Decision

Usar **Robot Framework** + **Appium** (Python) como única stack de automação mobile deste repositório, com execução via `robot` / `pabot` e dependências em `config/requirements.txt`.

## Alternatives considered

1. Behave + Selenium — citados no README raiz; sem `features/` nem dependências no código atual.
2. Locust — performance; fora do propósito de aceitação/regressão UI mobile.
3. Manter duas stacks — custo e divergência de locators/fluxos sem evidência de necessidade.

## Consequences

**Positive**

- Uma base de keywords para Android e iOS.
- Alinhamento com `docs/README.md`, makefile e estrutura `robot/`.

**Negative**

- README raiz permanece enganoso até ser alinhado (dívida conhecida).

**Neutral**

- Node.js permanece apenas pré-requisito de ambiente Appium, não app do repo.
