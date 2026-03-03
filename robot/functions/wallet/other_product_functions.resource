*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/other_product_screen.resource
Resource    ../../screens/wallet/other_product_screen.resource
Library      ${EXECDIR}/resource/utils/regex_money_utils.py

*** Keywords ***

Navigate To Other Products Screen From Institution Page
    [Documentation]    Navega para a tela de outros produtos a partir da página da instituição

    Navigate To Other Products Screen From Institution Page Screen

Validate Header Other Products
    [Documentation]    Valida o header da tela de outros produtos
    Validate Header Other Products Screen 

Validate Card Order Classes Other Products
    [Documentation]    Valida os cards das classes na tela de outros produtos.
    Validate Card Order Classes Other Products Screen

Navigate To Inside Other Product Card
    [Documentation]    Navega para dentro do card de outro produto
    Navigate To Inside Other Product Card Screen

Validate Button Load More Other Products
    [Documentation]    Valida o botão de carregar mais na tela de outros produtos
    Validate Button Load More Other Products Screen