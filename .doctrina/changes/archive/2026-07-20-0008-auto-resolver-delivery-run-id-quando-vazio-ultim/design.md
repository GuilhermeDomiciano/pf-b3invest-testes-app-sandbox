# Design — Change 0008

## Approach

Antes do `download-artifact`, um step Python consulta `GET /repos/{DELIVERY_REPO}/actions/artifacts?name=...` com `PIPELINE_COMMIT_PAT` e escolhe o `workflow_run.id` mais recente não expirado. Para `both`, exige um run presente em android-apk e ios-ipa.

## Alternatives considered

1. Exigir sempre `workflow_call` com `github.run_id` — não cobre dispatch manual.
2. Listar workflow runs por nome de workflow — precisa saber o nome exato no outro repo.

## Trade-offs and risks

- “Último artifact” pode não ser o build desejado (branch/env). Pin numérico continua disponível.
- PAT precisa de `actions:read` no repo de delivery.

## Decisions to record as ADRs

—
