# Change 0011 — iOS CI: IPA discovery + keyword duplicado + timeout

- **Status:** applied
- **Applied:** 2026-07-20
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** test-runtime

## Why

iOS no GHA falhou ao lançar `br.com.b3.investidor.cert` no BrowserStack e o job parecia travado. Havia keyword duplicado `Validate Complete Class Detail`. O path local Windows do IPA não é necessário no CI — o artifact já traz `b3i_app_base.ipa`.

## What

- Preferir `b3i_app_base.ipa` / `app-cert-release.apk` no find do download/upload.
- Unificar keyword duplicado em `wallet_details.resource`.
- `timeout-minutes: 60` nos jobs test-android/test-ios.
- `fullReset` no open iOS BS; teardown BS skip se sem sessão.

## Scope boundaries

- Não corrige crash/signing do IPA no dispositivo BS (causa tipica do "Cannot launch … application") — exige log do App Automate / time de app.
- Não altera bundle id hardcoded (BS lê do IPA).

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

- Se launch iOS continuar falhando: conferir no dashboard BS o session log do IPA cert vs device `iPhone 15 Pro` / iOS 17.
