*** Settings ***
Documentation    Wallet

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/earnings/earnings_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    proventos a receber
# 19 cenarios de teste relacionados a tela proventos a receber.
*** Test Cases ***
Validate Header, Graph And Items In My Earnings To Receive Screen 
    [Documentation]    PFSAPP-566 - PFSAPP-567 - PFSAPP-568 - PFSAPP-569 - PFSAPP-570 - PFSAPP-571 - Valida os elementos do head, gráfico e itens da tela de meus proventos a receber.
    [Tags]    PFSAPP-566 - PFSAPP-567 - PFSAPP-568 - PFSAPP-569 - PFSAPP-570 - PFSAPP-571

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Receive Proventos Screen
    Validate Proventos To Receive Header Screen
    Validate Earnings To Receive Graph Screen
    Log    Validação head da tela e do botão de voltar na tela de outros produtos concluída

Validate Load More Button In My Earnings To Receive Screen, Pagination And Fixed Date
    [Documentation]     PFSAPP-1209 - Valida recebidos itens da tela de meus proventos a receber, o botão de carregar mais e a data fixa dos itens.
    [Tags]    PFSAPP-1209 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Enable TalkBack
    Navigation To My Earnings Screen
    Navigate To Receive Proventos Screen
    Validate Proventos To Receive Header Screen
    Validate Load More Button Proventos Received Item Screen
    Log   Valida recebidos itens da tela de meus proventos recebidos, o botão de carregar mais e a data fixa dos itens. 


Validate Change Date After Click Load More Button In My Earnings To Receive Screen
    [Documentation]     PFSAPP-1210 - PFSAPP-1211 - Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.
    [Tags]    PFSAPP-1210 - PFSAPP-1211 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Enable TalkBack
    Navigation To My Earnings Screen
    Navigate To Receive Proventos Screen
    Validate Proventos To Receive Header Screen
    Validate Load More Updates Date List Screen
    Validate Mis Date Screen
    Log   Valida se a data dos itens de proventos a receber é atualizada após clicar no botão de carregar mais.

# ! ver outra massa
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

# TODO precisa validar data de hoje ideia é extrair o id da tela(nao peguei) e pedir um date now e comprar se é igual.
Validate Received Items In My Earnings To Receive Screen Graph Hide Data
    [Documentation]    PFSAPP-769 - PFSAPP-770 - PFSAPP-771 - PFSAPP-772 
    [Tags]    PFSAPP-769 - PFSAPP-770 - PFSAPP-771 - PFSAPP-772 

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Receive Proventos Screen
    Validate Earnings To Receive Graph Screen
    Validate Earnings To Receive Hide Graph Item Screen
    Log    Validação de ocultar dados do gráfico de proventos concluída

Validate Details Screen In My Earnings To Receive
    [Documentation]    PFSAPP-1621 - PFSAPP-1622 - PFSAPP-1623 - PFSAPP-1624 - PFSAPP-1625 Valida se é possível acessar os detalhes do item de proventos a receber e se as informações são exibidas corretamente.
    [Tags]    PFSAPP-1621 - PFSAPP-1622 - PFSAPP-1623 - PFSAPP-1624 - PFSAPP-1625

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Receive Proventos Screen
    Validate Proventos To Receive Header Screen
    Validate Access Details Asset Button Proventos To Receive Item Screen
    Validate Details Head Page Proventos To Receive Item Screen
    Validate Details Active Proventos To Receive Item Screen
    Validate Details Event Proventos To Receive Item Screen
    Back Screen My Earnings Screen    OPTIONS=A_RECEBER
    Log   Valida se é possível acessar os detalhes do item de proventos a receber e se as informações são exibidas corretamente.

# ! - PFSAPP-773 e PFSAPP-774 - Nao sao possiveis de ser automatizados, pois o elemento nao é visivel e alinhamento nao pode ser validado via automação.