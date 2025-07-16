*** Settings ***
Documentation    Home Functions

Resource    ${EXECDIR}/robot/screens/home/home_screen.resource

*** Keywords ***
Validate Home Login
    [Documentation]    Validate User Login

    Validate Login User
    Validate Saldo User
