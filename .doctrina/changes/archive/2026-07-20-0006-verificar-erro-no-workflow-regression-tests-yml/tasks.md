# Tasks — Change 0006-verificar-erro-no-workflow-regression-tests-yml

- [x] Diagnosticar log: `run-id: true` / `delivery_run_id` inválido → Not Found no download-artifact.
- [x] Endurecer Validate delivery run ID (regex numérico + mensagem clara).
- [x] Atualizar description do input `delivery_run_id` no workflow_dispatch.
- [x] Escrever delta `test-runtime` (requisito fail-fast + critério 12).

## Closing steps

- [x] Apply the change: merge each delta into the corresponding spec.
- [x] Archive the change folder to `.doctrina/changes/archive/2026-07-20-0006-verificar-erro-no-workflow-regression-tests-yml/`.
- [x] Update `.doctrina/index.json` with new or modified artifacts.
