*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsUpdateProfile.robot
Resource             ../OpenNewAccount/KeywordsOpenNewAccount.robot
Test Setup           Iniciar Sessao Autenticada
Test Teardown        Teardown Padrao


*** Test Cases ***

QBEF-40 Update First Name Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo first name  ${FIRSTNAME}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-41 Update Last Name Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo last name   ${LASTNAME}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-42 Update Address Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo address     ${STREET}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-43 Update City Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo city        ${CITY}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-44 Update State Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo state       ${STATE}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-45 Update Zipcode Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo zipcode     ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-46 Update Phone Number Profile
    [Tags]    update-profile    Positive
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                       ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral do campo phone number    ${PHONE}
        Capturar Print Na Pasta Da Funcionalidade                       ${TEST NAME} step-02     UpdateProfile

    Então o sistema deve realizar a atualização do campo
        Capturar Print Na Pasta Da Funcionalidade                       ${TEST NAME} step-03     UpdateProfile


QBEF-47 Update Profile FAIL - Not First Name
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${EMPTY}    ${LASTNAME}    ${STREET}   ${CITY}   ${STATE}    ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo fisrt name
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile


QBEF-48 Update Profile FAIL - Not Last Name
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${EMPTY}    ${STREET}   ${CITY}   ${STATE}    ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo last name
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-49 Update Profile FAIL - Not Street 
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${LASTNAME}    ${EMPTY}   ${CITY}   ${STATE}    ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo street
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-50 Update Profile FAIL - Not City 
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${LASTNAME}    ${STREET}   ${EMPTY}   ${STATE}    ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo city
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-51 Update Profile FAIL - Not State 
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${LASTNAME}    ${STREET}   ${CITY}   ${EMPTY}    ${ZIP}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo state
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

QBEF-52 Update Profile FAIL - Not ZipCode 
    [Tags]    update-profile    Negative
    Dado que o usuário esteja na tela de atualização cadastral
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

    Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${LASTNAME}    ${STREET}   ${CITY}   ${STATE}    ${EMPTY}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

    Então o sistema NÃO deve realizar a atualização e apresentar erro do campo zipcode
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile

    
# QBEF-52 Update Profile FAIL - Not Phone Number 
#     [Tags]    update-profile    Negative
#     Dado que o usuário esteja na tela de atualização cadastral
#         Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     UpdateProfile

#     Quando ele realiza a atualização cadastral inválida             ${FIRSTNAME}    ${LASTNAME}    ${STREET}   ${CITY}   ${STATE}    ${ZIP}
#         Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     UpdateProfile

#     Então o sistema NÃO deve realizar a atualização e apresentar erro do campo phone number
#         Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     UpdateProfile
