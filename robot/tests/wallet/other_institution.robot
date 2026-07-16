*** Settings ***
Documentation    Wallet Details - Navegação e validação do botão Voltar na tela de detalhe da classe

Resource    ${EXECDIR}/robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/wallet/other_institution_functions.resource
Resource    ../../functions/wallet/wallet_functions.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    other_institution
# 9 cenarios de teste relacionados a tela outras instituiçoes.
*** Test Cases ***

Validate Other Institutions Screen Information TopBar And Card
    [Documentation]   PFSAPP-617, PFSAPP-618, PFSAPP-619

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigation Other Institution Button Screen Wallet
    Validate Other Institutions Screen Information TopBar
    Validate Button Institution
    Validate Card Institution
    Navigate To Institution Page From Other Institutions
    Back Navigation From Other Institutions
    Log    Validação do TopBar e Card da tela de outras instituições concluída

Validate OtherInstitutions Screen Order Cards
    [Documentation]   PFSAPP-620, PFSAPP-623

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigation Other Institution Button Screen Wallet
    Validate Other Institutions Screen Information TopBar
    Validate Order Cards Institution
    Log    Validação da ordem dos cards na tela de outras instituições concluída

Validate Other Institutions Screen Show Three Products
    [Documentation]   PFSAPP-621, PFSAPP-622

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigation Other Institution Button Screen Wallet
    Validate Other Institutions Screen Information TopBar
    Validate Three Products Institution
    Validate Load More Products one and three In Other Institutions
    Log    Validação de tres produtos por instituicao concluida 

Validate Other Institutions Scroll Voice Over Enabled
    [Documentation]   PFSAPP-624, PFSAPP-625

    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Wallet
    Navigation Other Institution Button Screen Wallet
    Validate Other Institutions Screen Information TopBar
    Validate Scroll Voice Over Enabled In Other Institutions
    Log    Validação de scroll com voice over habilitado concluida