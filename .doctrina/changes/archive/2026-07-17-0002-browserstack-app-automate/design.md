# Design — Change 0002-browserstack-app-automate

## Abordagem

Reusar a bifurcação existente (`ENVIRONMENT=bs` → `Open App Browserstack`) e torná-la operacional:

1. **Pré-requisito:** 0001 entrega credenciais e app ids via `.env`.
2. **Makefile:** unificar `LOGS_DIR` / `LOG_DIR` para que `run-bs-*` grave logs de fato.
3. **Capabilities:** manter `bstack:options` atuais; ler `APP_*_BS`, `USERNAME_BS`, `ACESSKEY_BS`, `PROJECT_NAME_BS`, `BUILD_BS` do env/settings pós-loader.
4. **Smoke path:** documentar e validar um comando mínimo:
   `robot -v PLATFORM_NAME:android -v ENVIRONMENT:bs -i login -d ./logs robot/tests/`
5. **Docs + skill:** procedimento de upload de app no App Automate → copiar `bs://` para `.env` → `make run-bs-android`.

Suites de domínio permanecem agnósticas (ADR 0002 / 0003).

## Alternativas consideradas

1. **BrowserStack SDK / `browserstack.yaml`** — README raiz antigo; rejeitado (ADR 0001: Robot + AppiumLibrary).
2. **Duplicar suites `*_bs.robot`** — custo alto; rejeitado.
3. **Só documentar sem corrigir makefile** — logs quebrados; rejeitado.

## Trade-offs e riscos

- Wildcards de device podem flakyar se a oferta BS mudar.
- App ids expiram/rotacionam — precisam viver só no `.env`.
- Parallel `pabot` em BS consome minutos de device; smoke serial primeiro.

## Decisões a registrar como ADRs

- Nenhuma nova além de ADR 0003 (já aceita) + ADR 0004 (dotenv). Se pinarmos a matrix de devices no futuro, abrir ADR dedicada.
