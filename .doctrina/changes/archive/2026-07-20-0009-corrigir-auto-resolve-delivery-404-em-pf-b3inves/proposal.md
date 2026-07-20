# Change 0009 — Diagnóstico 404 + delivery_repo + layout APK confirmado

- **Status:** applied
- **Applied:** 2026-07-20
- **Date:** 2026-07-20
- **Owner:** agent
- **Affects specs:** test-runtime

## Why

Auto-resolve retornou HTTP 404 em `b3sa/pf-b3invest-app`. Nomes de artifact (`android-apk` / `ios-ipa`) e layout (`app-cert-release.apk` dentro do zip) estão corretos; a falha é acesso/repo do list-artifacts.

## What

- Input `delivery_repo` + mensagem 404 no Resolve.
- Docs: layout do artifact e distinção do Angular Delivery Cert.

## Scope boundaries

- Não altera nomes `android-apk` / `ios-ipa` (já batem com a evidência do operador).
- Default de `delivery_repo` permanece até o operador informar o owner/repo do run que gerou os artifacts.

## Verification

- [x] Automated checks pass (`doctrina verify`, or the project's typecheck/test/build).
- [x] The affected spec's acceptance criteria are met and cite their evidence (`doctrina coverage`).

## Open questions

- URL do run Actions que listou `android-apk` / `ios-ipa` (para fixar `delivery_repo` + `delivery_run_id`)?
