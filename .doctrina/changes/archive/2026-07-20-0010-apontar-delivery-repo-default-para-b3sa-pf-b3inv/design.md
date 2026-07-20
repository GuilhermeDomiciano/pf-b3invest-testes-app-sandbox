# Design — Change 0010

## Approach

Artifacts de reusable workflow ficam no **caller** (`pf-b3invest-app-base`), não no repo `pf-b3invest-reusable-workflows`. Default do regression aponta para o caller.

## Alternatives considered

Baixar de `pf-b3invest-reusable-workflows` — incorreto para `workflow_call` artifacts.

## Trade-offs and risks

PAT precisa de `actions:read` em `b3sa/pf-b3invest-app-base`.

## Decisions to record as ADRs

—
