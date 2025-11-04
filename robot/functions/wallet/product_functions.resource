*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/product_screen.resource

*** Keywords ***
Validate Load More Button When Accessibility On
    [Documentation]    Validate Load More Button When Accessibility On

    Click On Load More When TalkBack Enabled

Validate Access All Products Button Section Screen Product Wallet
    [Documentation]    Validate Access All Products Button Screen Product Wallet

    Click On Access All Products Button Screen Wallet 