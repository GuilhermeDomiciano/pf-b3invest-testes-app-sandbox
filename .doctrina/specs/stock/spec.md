# Spec — stock

**Capability:** stock
**Status:** active
**Implementation:** implemented
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, login, home
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza mercado / Ibovespa (stock market) na AppB3 conforme a suite e keywords existentes.

## Requirements (EARS)

### Ubiquitous

- The system shall provide stock market screen and function keywords with locators in `robot/elements/stock_market.yaml`.
- The system shall keep executable stock scenarios under `robot/tests/stock/`.

### Event-driven

- When the user opens mercado/Ibovespa from the app, the system shall navigate and assert via stock market keywords.

### State-driven

- While on the stock market surface, the system shall use stock-scoped resources for interactions and assertions.

### Unwanted-behavior (must-not)

- The system shall not depend on wallet detail keywords to assert stock-market-only UI.

### Optional

- Where new market widgets ship, the system may extend `stock_market.robot` under this capability.

## Acceptance criteria

1. [unverified] Stock suite exists — verified by `robot/tests/stock/stock_market.robot`.
2. [unverified] Screen, functions, and YAML exist — verified by `robot/screens/stock/stock_market_screen.resource`, `robot/functions/stock/stock_market_functions.resource`, `robot/elements/stock_market.yaml`.

## Maturity

**MVP (committed):**

- Stock market suite + layered resources for current UI.

**Future (aspirational, not committed):**

- Additional market depth (order book, quotes) if product adds testable surfaces.

## Out of scope for this spec

- Wallet renda variável details (see `wallet`).
