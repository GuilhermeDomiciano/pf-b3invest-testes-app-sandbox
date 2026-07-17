# Spec — wallet

**Capability:** wallet
**Status:** active
**Implementation:** partial — filtros Flutter, gráficos, ordenação, load more e casos fora do MVP pendentes
**Realizes:** SC5
**Depends on:** test-runtime, ui-layers, login, home
**Last updated:** 2026-07-17
**Version:** 0.1.0

## Purpose

Automatiza carteira da AppB3: visão geral, produtos, classes, instituições, outros produtos/instituições e detalhes (renda fixa, variável, internacional, instituição).

## Requirements (EARS)

### Ubiquitous

- The system shall provide wallet screen and function resources under `robot/screens/wallet/` and `robot/functions/wallet/`.
- The system shall keep wallet-related locators in YAML (`wallet`, `product`, `class`, `institute`, `other_*`, `detail_classe`, etc.).
- The system shall keep executable wallet suites under `robot/tests/wallet/`.

### Event-driven

- When the user opens carteira from home, the system shall navigate and assert via wallet keywords.
- When a detail suite targets renda fixa, variável, internacional, or instituição, the system shall use the corresponding detail keywords/resources.
- When a scenario is marked out of MVP or blocked by invisible Flutter accessibility, the system shall document the gap in comments and not treat it as committed green coverage.

### State-driven

- While browsing products/classes/institutions, the system shall reuse layered keywords instead of duplicating locators in each suite.

### Unwanted-behavior (must-not)

- The system shall not claim chart (line/bar) validation is done while keywords mark it pending.
- The system shall not claim filter clicks work where Flutter accessibility codes are not exposed.

### Optional

- Where a user has more than three institutions, the system may exercise institution load-more.

## Acceptance criteria

1. [unverified] Wallet suites exist under `robot/tests/wallet/` — verified by `robot/tests/wallet/wallet.robot`, `robot/tests/wallet/product_wallet.robot`, `robot/tests/wallet/class_wallet.robot`, `robot/tests/wallet/institution_wallet.robot`.
2. [unverified] Detail suites exist for asset classes — verified by `robot/tests/wallet/wallet_details_rendaFixa.robot`, `robot/tests/wallet/wallet_details_rendaVariavel.robot`, `robot/tests/wallet/wallet_details_internacional.robot`, `robot/tests/wallet/wallet_details_institution.robot`.
3. [unverified] Screen/function layers exist — verified by `robot/screens/wallet/`, `robot/functions/wallet/`.

## Maturity

**MVP (committed):**

- Suites and keywords for carteira, produtos, classes, instituições and detail happy paths currently automated.

**Future (aspirational, not committed):**

- Filter interaction where Flutter locators are missing.
- Chart validation, list ordering extraction, load-more with >3 institutions.
- Action buttons / divulgação de resultados marked out of MVP.
- CA03 currently noted as untestable in renda fixa details.
- Disabled-attribute logic fix in `wallet_details_screnn.resource`.

## Out of scope for this spec

- Earnings / statement / stock domains.
- App production wallet business rules beyond UI verification.
