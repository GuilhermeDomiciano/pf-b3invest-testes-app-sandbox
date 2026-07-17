# Design — Change 0004-parallel-android-ios

## Approach

Dois processos `robot` em paralelo (threads que só aguardam o subprocess), cada um com `-v PLATFORM_NAME` e `-d logs/parallel/<env>/<platform>`. Mesma suite/tag; o exit code agregado é falha se qualquer plataforma falhar.

Devices no BS: variáveis por plataforma no `.env`, porque um único `DEVICE_NAME_BS` seria herdado pelos dois processos e quebraria iOS ou Android.

## Alternatives considered

- **Pabot com `--argumentfile` por plataforma:** mais complexo no Windows e mistura com o uso atual de Pabot por tags de domínio.
- **Job CI matrix só:** não resolve o pedido local/Windows sem Make.

## Trade-offs and risks

- BS cobra 2 sessões em paralelo (device-minutes).
- Local precisa de dois drivers Appium (ou dois ports) se ambos forem local.
- Logs não unificados — o operador olha duas pastas.

## Decisions to record as ADRs

- Nenhuma (continua ADR 0003 — dual local/BS).
