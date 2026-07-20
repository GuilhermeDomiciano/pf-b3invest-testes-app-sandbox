# Spec Delta — capability: test-runtime

**Operation:** MODIFIED
**Target spec on apply:** `.doctrina/specs/test-runtime/spec.md`

<!-- Applied manually 2026-07-20 (append-requirement is not a valid ops verb). Spec is at 0.8.0. -->

```ops
set-header Implementation: partial — GHA regression; delivery_run_id numeric fail-fast (change 0006)
set-header Version: 0.8.0
set-header Last updated: 2026-07-20
```

---

Diagnóstico da falha 2026-07-20: `inputs.delivery_run_id` = `"true"` → `run-id: true` → Not Found.
Requisito event-driven + critério 12 mesclados em `.doctrina/specs/test-runtime/spec.md`.
