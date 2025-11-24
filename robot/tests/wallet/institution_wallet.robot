*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    institution_wallet

*** Test Cases ***
Validate Back Button Inside Filter Institutions
    [Documentation]    PFSAPP-252 - Validate the back button functionality inside the institutions screen
    [Tags]    botao_voltar_instituicoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Back Button Screen Wallet Filter Institutions
Validate Institutions Screen Information TopBar
    [Documentation]   PFSAPP-252-CA01, PFSAPP-252-CA02, PFSAPP-252-CA03 and PFSAPP-252-CA04 - Validate the title 'All Institutions', the quantity of products in the wallet, the display of profitability over the last 30 days, and the display of the number of assets and institutions
    [Tags]    todos_produtos_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Validate All Contents Inside Filters    instituicao

Validate Institutions Screen Information Body
    [Documentation]    PFSAPP-252-CA05, PFSAPP-252-CA06, PFSAPP-252-CA07- PFSAPP-252-CA11 - Validate the body screen and button load more inside the institutions screen
    [Tags]    todas_instituicoes_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Validate And Navigate To Institutions Products And Button Load More

Validate Order Of Cards Inside Institutions Screen
    [Documentation]    PFSAPP-252-CA08 - Validate the order of cards inside the institutions screen
    [Tags]    todas_instituicoes_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Validate Card Order Classes Institutions

Validate Voice Over Button Institutions Screen
    [Documentation]    PFSAPP-252-CA08 - Validate the order of cards inside the institutions screen
    [Tags]    todas_instituicoes_informacoes

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate All Institutes Button Screen Wallet
    Validate Voice Over Button Institutions

Validate Error Api Class Screen
    [Documentation]    PFSAPP-252-CA013 - Validate the error message displayed when the API fails to load class data
    [Tags]    erro_api_classe
    
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Validate Error Api Institution Screen
   #10 e 09 nao tem como fazer automatizado