# Spec Delta — capability: test-runtime

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-runtime/spec.md`

```ops
set-header Implementation: partial — GHA regression; iOS IPA find + keyword fix (change 0011)
set-header Version: 0.9.3
set-header Last updated: 2026-07-20
```

---

CI localiza `b3i_app_base.ipa` / `app-cert-release.apk` via `find`; timeout 60m nos jobs de teste; keyword duplicado em wallet_details corrigido (suporte à suite).
