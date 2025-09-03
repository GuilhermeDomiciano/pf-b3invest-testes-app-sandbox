*** Settings ***
Documentation    Wallet Functions

Resource    ${EXECDIR}/robot/screens/wallet/wallet_screen.resource

*** Keywords ***
Validate Wallet Items
    [Documentation]    Validate Wallet Items

    Navigate To My Wallet From Home Screen Wallet
    Validate Toggle Visibility Screen Wallet
    Validate My Wallet Screen Wallet
    Validate Allocation Filter Buttons Screen Wallet
    Validate Access All Products Button Screen Wallet
    Validate Wallet Action Buttons Screen Wallet
    Click Graphic Bar Screen Wallet
    Click Graphic Line Screen Wallet

Navigation To My Wallet
    [Documentation]    Navigate To My Wallet From Home Screen Wallet

    Navigate To My Wallet From Home Screen Wallet
    
Validate Access All Products Button Screen Wallet
    [Documentation]    Validate Button Customize Home Screen

    Click Access All Products Button Screen Wallet
