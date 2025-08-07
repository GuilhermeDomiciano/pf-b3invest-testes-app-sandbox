*** Settings ***
Documentation    Home Functions

Resource    ${EXECDIR}/robot/screens/home/home_screen.resource

*** Keywords ***
Validate Home Login
    [Documentation]    Validate Home Login

    Validate Toggle Visibility
    Validate Heritage Summary
    Validate My Wallet
    Click Graphic Bar
    Click Graphic Line
    Validate Open Finance
