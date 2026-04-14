*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/earnings/earnings_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    other_product_wallet
# x cenarios de teste relacionados a tela outros produtos.
*** Test Cases ***
Validate Header, Graph And Items In My Earnings Screen 
    [Documentation]    PFSAPP-566 - PFSAPP-567 - PFSAPP-568 - PFSAPP-569 - Valida os elementos do head, gráfico e itens da tela de meus proventos recebidos.
    [Tags]    PFSAPP-566 - PFSAPP-567 - PFSAPP-568 - PFSAPP-569 - PFSAPP-1209

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Validate Proventos Header Screen
    Validate Proventos Graph Screen
    Validate Proventos Received Item Screen
    Log    Validação head da tela e do botão de voltar na tela de outros produtos concluída

Validate Load More Button In My Earnings Screen, Pagination And Fixed Date
    [Documentation]     PFSAPP-1209 - Valida recebidos itens da tela de meus proventos recebidos, o botão de carregar mais e a data fixa dos itens.
    [Tags]    PFSAPP-1209 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Enable TalkBack
    Navigation To My Earnings Screen
    Validate Proventos Header Screen
    Validate Load More Button Proventos Received Item Screen
    Log   Valida recebidos itens da tela de meus proventos recebidos, o botão de carregar mais e a data fixa dos itens. 


Validate Change Date After Click Load More Button In My Earnings Screen
    [Documentation]     PFSAPP-1210 - PFSAPP-1211 - Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.
    [Tags]    PFSAPP-1210 - PFSAPP-1211 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Enable TalkBack
    Navigation To My Earnings Screen
    Validate Proventos Header Screen
    Validate Load More Updates Date List Screen
    Validate Mis Date Screen
    Log   Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.

Validate Empty State My Earnings Screen
    [Documentation]    PFSAPP-573 - Valida o estado vazio da tela de meus proventos.
    [Tags]    PFSAPP-573

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Validate Proventos Available Soon Text Screen
    Log    Validação de proventos vazio concluída