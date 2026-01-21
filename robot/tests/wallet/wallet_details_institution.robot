*** Settings ***
Documentation    Wallet Details - Navegação e validação do botão Voltar na tela de detalhe da classe

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    wallet_details
# 15 cenarios de teste relacionados a tela de detalhes da carteira
*** Test Cases ***

Validate Institutions Screen Information TopBar
    [Documentation]   PFSAPP-259-CA01, PFSAPP-252-CA02, PFSAPP-252-CA03 and PFSAPP-252-CA04 - Validate the title 'All Institutions', the quantity of products in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    N