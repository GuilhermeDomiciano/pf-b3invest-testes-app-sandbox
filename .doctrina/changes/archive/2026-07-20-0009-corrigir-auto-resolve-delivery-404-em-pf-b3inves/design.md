# Design — Change 0009

## Approach

Melhorar falha e tornar o repo do artifact um input. Bloquear avanço automático até o operador indicar o pipeline mobile correto.

## Alternatives considered

Trocar default para `pf-b3invest-reusable-workflows` — rejeitado: esse repo hospeda reusable workflows, em geral não é onde o run do app sobe artifacts de build.

## Trade-offs and risks

Sem o repo certo, auto-resolve continua falhando; workaround é `bs://` manual.

## Decisions to record as ADRs

—
