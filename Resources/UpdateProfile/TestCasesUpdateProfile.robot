*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsUpdateProfile.robot
Resource             ../OpenNewAccount/KeywordsOpenNewAccount.robot
Test Teardown        Teardown Padrao


*** Test Cases ***

QBEF-40 Update First Name Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_FIRSTNAME}    ${FIRSTNAME}
    Então o sistema deve realizar a atualização do campo

QBEF-41 Update Last Name Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_LASTNAME}    ${LASTNAME}
    Então o sistema deve realizar a atualização do campo

QBEF-42 Update Address Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_STREET}    ${STREET}
    Então o sistema deve realizar a atualização do campo

QBEF-43 Update City Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_CITY}    ${CITY}
    Então o sistema deve realizar a atualização do campo

QBEF-44 Update State Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_STATE}    ${STATE}
    Então o sistema deve realizar a atualização do campo

QBEF-45 Update Zipcode Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_ZIP}    ${ZIP}
    Então o sistema deve realizar a atualização do campo

QBEF-46 Update Phone Number Profile
    [Tags]    update-profile    Positive
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral de um campo    ${INPUT_PHONE}    ${PHONE}
    Então o sistema deve realizar a atualização do campo

QBEF-47 Update Profile FAIL - Not First Name
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${EMPTY}    ${LASTNAME}    ${STREET}    ${CITY}    ${STATE}    ${ZIP}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_FIRSTNAME}

QBEF-48 Update Profile FAIL - Not Last Name
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${FIRSTNAME}    ${EMPTY}    ${STREET}    ${CITY}    ${STATE}    ${ZIP}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_LASTNAME}

QBEF-49 Update Profile FAIL - Not Street
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${FIRSTNAME}    ${LASTNAME}    ${EMPTY}    ${CITY}    ${STATE}    ${ZIP}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_STREET}

QBEF-50 Update Profile FAIL - Not City
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${FIRSTNAME}    ${LASTNAME}    ${STREET}    ${EMPTY}    ${STATE}    ${ZIP}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_CITY}

QBEF-51 Update Profile FAIL - Not State
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${FIRSTNAME}    ${LASTNAME}    ${STREET}    ${CITY}    ${EMPTY}    ${ZIP}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_STATE}

QBEF-52 Update Profile FAIL - Not ZipCode
    [Tags]    update-profile    Negative
    [Setup]    Iniciar Sessao Autenticada    UpdateProfile
    Dado que o usuário esteja na tela de atualização cadastral
    Quando ele realiza a atualização cadastral inválida    ${FIRSTNAME}    ${LASTNAME}    ${STREET}    ${CITY}    ${STATE}    ${EMPTY}
    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório    ${ERRO_ZIP}