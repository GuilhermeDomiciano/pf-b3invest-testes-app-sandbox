*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/earnings/earnings_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    proventos recebido
# 14 cenarios de teste relacionados a tela proventos recebido.
*** Test Cases ***
Validate Header, Graph And Items In My Earnings Screen 
    [Documentation]    PFSAPP-566 - PFSAPP-567 - PFSAPP-568 - PFSAPP-569 - PFSAPP-570 - PFSAPP-571 - Valida os elementos do head, gráfico e itens da tela de meus proventos recebidos.
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

Validate Received Items In My Earnings Screen Graph Hide Data
    [Documentation]    PFSAPP-763 - PFSAPP-764 - PFSAPP-765 - PFSAPP-766 
    [Tags]    PFSAPP-763 - PFSAPP-764 - PFSAPP-765 - PFSAPP-766 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Validate Proventos Graph Screen
    Validate Earnings Hide Graph Item Screen
    Log    Validação de ocultar dados do gráfico de proventos concluída

Validate Details Screen In My Earnings Received
    [Documentation]    PFSAPP-1616 - PFSAPP-1617 - PFSAPP-1618 - PFSAPP-1619 - PFSAPP-1620 - Valida se é possível acessar os detalhes do item de proventos recebidos e se as informações são exibidas corretamente.
    [Tags]    PFSAPP-1616 - PFSAPP-1617 - PFSAPP-1618 - PFSAPP-1619 - PFSAPP-1620

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Validate Proventos Received Item Screen
    Validate Access Details Asset Button Proventos Received Item Screen
    Validate Details Proventos Received Item Screen
    Check Money Value In Screen Details Proventos Received Item Screen
    Back Screen My Earnings Screen    OPTIONS=RECEBIDOS
    Log   Validação de detalhes do item de proventos recebidos concluída

# ! - PFSAPP-767 e PFSAPP-768 - Nao sao possiveis de ser automatizados, pois o elemento nao é visivel e alinhamento nao pode ser validado via automação.