*** Settings ***
Documentation    Testes da tela de extrato
Resource    ${EXECDIR}/robot/base.resource
Resource    ${EXECDIR}/robot/functions/statement/statement_functions.resource
Resource    ../../../resource/utils/element_utils.resource

Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

*** Test Cases ***
Validate header do Statement Screen And Dates 
    [Documentation]   PFSAPP-390-CA01, 02, 03, 04, 06, 07  Valida o cabeçalho da tela de extrato
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...     PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation Screen Home Statement Function
    Validate Statement Header Section Function
    Validate Statement Future Transactions Section Function
    Validate Statement Last Transactions Section Function

Validate Pagination of Statement Entries
    [Documentation]    PFSAPP-390-CA08 Valida a paginação dos lançamentos na tela de extrato voice over ativo
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation Screen Home Statement Function
    Card Pagination Function

Validar últimos lançamentos do extrato
    [Documentation]    PFSAPP-390-CA05 Ordem dos últimos lançamentos do extrato
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Disable TalkBack
    Navigation Screen Home Statement Function
    Validate Statement Order Date Statement Function

Validar accessibility dos botões de navegação
    [Documentation]    PFSAPP-390-CA10 Valida os accessibility ids dos botões de navegação
    Simple Login    DOCUMENT=${users['user_cc_cpf']['document']}    
    ...             PASSWORD=${users['user_cc_cpf']['password']}
    No Accept Permissions
    Skip Profile
    Navigation Screen Home Statement Function
    Validate Statement Empty Section Function