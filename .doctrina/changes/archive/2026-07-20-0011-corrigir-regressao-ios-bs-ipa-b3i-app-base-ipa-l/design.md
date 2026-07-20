# Design — Change 0011

## Approach

Separar (1) bugs de suite/CI locais vs (2) falha de launch no App Automate. Hardening de find/timeout/keyword; launch residual fica com evidência BS.

## Alternatives considered

Passar path Windows no workflow — rejeitado; runner Linux não vê `C:\Users\...`.

## Trade-offs and risks

`fullReset` deixa o open iOS mais lento mas evita estado sujo entre testes.

## Decisions to record as ADRs

—
