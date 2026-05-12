*** Settings ***
Documentation    Wallet

Resource    ../../../robot/base.resource
Resource    ../../functions/wallet/institution_functions.resource
Resource    ../../functions/login/login_functions.resource
Resource    ../../functions/earnings/earnings_functions.resource
Test Setup       Launch Application AppB3
Test Teardown    Close Application AppB3

Test Tags    radar_proventos
# 15 cenarios de teste relacionados a tela radar de proventos.
*** Test Cases ***
Validate Radar Proventos Screen Popup Text Close To Understand
    [Documentation]    PFSAPP-896 - PFSAPP-897 - PFSAPP-900 - PFSAPP-901
    [Tags]    radar_proventos

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Radar Proventos Screen
    Validate Popup Text Radar Proventos Close To Understand Screen
    Return To Login Keeping Session Screen
    Again Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    Navigation To My Earnings Screen
    Navigate To Radar Proventos Screen
    Validate Text Radar Proventos Screen
    Validate Text Bottom Sheet Radar Proventos Screen
    Log    Validação da tela de radar de proventos concluída


Validate Radar Proventos Screen Popup Text Close To Close Icon
    [Documentation]    PFSAPP-898 - PFSAPP-899 - PFSAPP-900 - PFSAPP-901
    [Tags]    radar_proventos

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Radar Proventos Screen
    Validate Popup Text Radar Proventos Close To Close Icon Screen
    Return To Login Keeping Session Screen
    Again Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    Navigation To My Earnings Screen
    Navigate To Radar Proventos Screen
    Validate Text Radar Proventos Screen
    Validate Text Bottom Sheet Radar Proventos Screen
    Log    Validação da tela de radar de proventos concluída

Validate Close Bottom Sheet Radar Proventos Screen
    [Documentation]    PFSAPP-911 - PFSAPP-912 - PFSAPP-913 - PFSAPP-914 - PFSAPP-915 - PFSAPP-916 - PFSAPP-917
    [Tags]    radar_proventos

    Simple Login    DOCUMENT=${users['user_cc_cpf_wallet']['document']}
    ...             PASSWORD=${users['user_cc_cpf_wallet']['password']}
    No Accept Permissions
    Skip Profile
    Navigation To My Earnings Screen
    Navigate To Radar Proventos Screen
    Validate Popup Text Radar Proventos Close To Close Icon Screen
    Validate Text Bottom Sheet Radar Proventos Screen
    Validate Close Bottom Sheet Radar Proventos Screen
    Validate Scroll To close Icon Bottom Sheet Radar Proventos
    Log    Validação da tela de radar de proventos concluída
