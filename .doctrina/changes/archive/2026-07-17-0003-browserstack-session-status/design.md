# Design — Change 0003-browserstack-session-status

## Abordagem

Usar o executor oficial do App Automate no teardown, enquanto a sessão Appium ainda existe:

`browserstack_executor: {"action":"setSessionStatus","arguments":{"status":"passed|failed","reason":"..."}}`

via keyword `Execute Script` (AppiumLibrary), encapsulada em `Mark Browserstack Session Status`.  
No-op se `ENVIRONMENT != bs`. Erros de reporte viram WARN (não mascaram o resultado do teste).

Documentação canônica em `docs/guia-testes.md`; `melhorias-futuras.md` é backlog não-normativo.

## Alternativas consideradas

1. REST PUT na session API — mais frágil (precisa session id); executor é o path recomendado pela BS.
2. Listener Robot global — overkill para o MVP; teardown no base basta.

## Trade-offs e riscos

- Se `Close Application` rodar antes do status, o reporte falha → ordem: status → screenshot → close.
- `TEST_MESSAGE` pode ser longo → truncado a 240 chars.
