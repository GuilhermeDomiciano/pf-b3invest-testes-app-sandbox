# pf-b3invest-testes-app — Product

## Vision

Repositório de automação de testes mobile (Android e iOS) do aplicativo B3 Invest (`AppB3`), com base de código única em Robot Framework + Appium, para o time de QA executar aceitação e regressão em emulador/dispositivo local e em BrowserStack.

## Problem

Validar a app B3 Invest de ponta a ponta de forma repetível exige separar locators, ações de UI, fluxos e casos de teste, e rodar os mesmos cenários em ambiente local e na nuvem — sem depender de testes manuais frágeis ou de stacks divergentes por plataforma.

## Target users

- Time de QA / automação que escreve e executa os testes da app B3 Invest.
- Owner Backstage: `g_p_apl_alm_squad_0049_github` (sistema `b3-investidor`, domínio `pf`).
- Indiretamente: investidores PF da app sob teste (cenários CPF/CNPJ, carteira, proventos, etc.).

## Scope

In scope:

- Automação mobile Android e iOS da AppB3 com Robot Framework + Appium.
- Execução local (Appium + drivers UiAutomator2 / XCUITest) e BrowserStack App Automate.
- Camadas: locators YAML (`robot/elements/`), screens, functions e suites `.robot`.
- Domínios de teste existentes: login, cadastro, quiz, home, wallet, earnings, statement, stock, walkthrough.
- Serviços auxiliares de teste (ex.: Mailsac) e dados em YAML.
- Lint Robot (Robocop), orquestração via makefile, documentação TechDocs/MkDocs.

Out of scope (deferred or rejected):

- Implementação da app B3 Invest em si (este repo só testa).
- Behave / Selenium / Locust (citados no README raiz; não usados no código atual).
- Pipeline CI/CD versionado neste repo (ausente; status desconhecido).
- Banco de dados / schemas SQL (não presentes no código atual).
- Cenários explicitamente fora do MVP ou marcados como pendentes no código (open finance, gráficos, etc.) até reativados por change.

## Non-goals

- Não ser um framework genérico de testes para outros apps B3.
- Não substituir testes de API/backend ou performance (Locust).
- Não versionar APKs/IPAs no git (`app/` / artefatos ficam fora do tree).
- Não armazenar segredos em plain text como prática aceita (dívida conhecida a eliminar).

## Success criteria

- [SC1] Suites Robot da AppB3 executam em Android e iOS com as mesmas keywords de domínio.
- [SC2] O mesmo conjunto de tags pode rodar em `ENVIRONMENT:local` e `ENVIRONMENT:bs` via makefile / variáveis.
- [SC3] Locators, screens, functions e testes permanecem em camadas separadas e reutilizáveis.
- [SC4] Regressivo paralelo com Pabot (`-i gmud` / tag `regressivo`) produz logs utilizáveis.
- [SC5] Domínios existentes (login → home → wallet/earnings/statement/stock) cobrem os fluxos MVP commitados nas specs.

## Delivery order (walking skeleton)

1. **test-runtime** — abrir AppB3 em local Android (Appium + `ENVIRONMENT:local`).
2. **ui-layers** — keyword de domínio resolve locator YAML → screen → function.
3. **login** — autenticar usuário de fixture e chegar na home.
4. Demais domínios (home, wallet, earnings, statement, stock, cadastro, quiz, walkthrough) e **test-services** expandem sobre esse esqueleto.
