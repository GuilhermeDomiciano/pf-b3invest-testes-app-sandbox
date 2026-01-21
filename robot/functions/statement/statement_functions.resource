*** Settings ***
Documentation    Funções de alto nível para validação da tela de extrato
Resource    ../../screens/statement/statement_screen.resource

*** Keywords ***

Validate Statement Header Section Function
    [Documentation]    Chama validação do cabeçalho do extrato
    Validate Statement Header

Validate Statement Navigation Section Function
    [Documentation]    Chama validação da barra de navegação inferior
    Validate Statement Navigation Bar

Validate Statement Values Section Function
    [Documentation]    Chama validação dos valores principais do extrato
    Validate Statement Values Section

Validate Statement Future Transactions Section Function
    [Documentation]    Chama validação da seção de lançamentos futuros
    Validate Statement Future Transactions Section

Validate Statement Last Transactions Section Function
    [Documentation]    Chama validação da seção de últimos lançamentos
    Validate Statement Last Transactions Section

Validate Statement Empty Section Function
    [Documentation]    Chama validação dos accessibility ids dos botões de navegação
    Validate Statement Empty Section

Validate Statement Empty Message Section Function
    [Documentation]    Chama validação da mensagem de extrato vazio
    Validate Statement Empty Message

Validate Full Statement Screen Function
    [Documentation]    Chama validação agrupada da tela completa do extrato
    Validate Full Statement Screen

Navigation Screen Home Statement Function
    [Documentation]    Navega para a tela de extrato após login
    # Exemplo: clicar no botão de navegação ou usar keyword já existente
    Navigation Screen Home Statement

Card Pagination Function
    [Documentation]    Valida a paginação dos lançamentos na tela de extrato
    Validate Card Pagination Statement
    
Validate Card Order Home Statement Function
    [Documentation]    Valida a ordem dos cards na tela de extrato
    # Implementar a validação da ordem dos cards conforme necessário
    Validate Card Order Home Statement
    Log To Console    message=[B3] Validação da ordem dos cards na tela de extrato não implementada.\n

Validate Statement Order Date Statement Function
    [Documentation]    Valida a ordem das datas na seção de últimos lançamentos do extrato
    # Implementar a validação da ordem das datas conforme necessário
    Validate Statement Order Date Statement
    Log To Console    message=[B3] Validação da ordem das datas na seção de últimos lançamentos do extrato não implementada.\n