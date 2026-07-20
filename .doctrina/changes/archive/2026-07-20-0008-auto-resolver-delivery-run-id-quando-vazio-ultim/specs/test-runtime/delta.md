# Spec Delta — capability: test-runtime

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-runtime/spec.md`

<!-- Spec already merged to 0.9.0 by hand (requirement rewrite + criteria 12/13). -->

```ops
set-header Implementation: partial — GHA regression; auto-resolve delivery_run_id (change 0008)
set-header Version: 0.9.0
set-header Last updated: 2026-07-20
```

---

Auto-resolve `delivery_run_id` via GitHub Artifacts API when empty/latest/auto/true.
