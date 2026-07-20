# Design — Change 0006-verificar-erro-no-workflow-regression-tests-yml

## Approach

No job `download-artifacts`, validar `delivery_run_id` via env var + bash regex numérico antes de chamar `actions/download-artifact@v4`. Mensagem de erro aponta a confusão com `upload_new_build` e onde obter o Run ID em `b3sa/pf-b3invest-app`.

## Alternatives considered

1. Manter só checagem de vazio — rejeitado: `"true"` passa e o Not Found é opaco.
2. Resolver automaticamente o último run de Delivery — fora de escopo; exige API/convenções do outro repo.

## Trade-offs and risks

- Validação local não garante que o run exista ou tenha o artifact; ainda pode Not Found se o ID estiver errado ou o artifact tiver outro nome.
- Fail-fast elimina o caso mais comum (boolean no lugar do ID).

## Decisions to record as ADRs

-
