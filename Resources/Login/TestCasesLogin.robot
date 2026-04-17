*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsLogin.robot   
Test Setup           Dado que eu acesse o site Parabank
Test Teardown        Teardown Padrao


*** Test Cases ***
QBEF-01 Login Sucess
    [Tags]    Login    Positive
    Dado que o usuário esteja na tela de Login
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-01    Login

    Quando ele preencher os campos de usuario e senha           ${USUARIO_VALIDO}    ${SENHA_VALIDO}
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-02    Login

    Então ele deve ser redirecionado para a página inicial
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-03    Login


QBEF-02 Login Fail
    [Tags]    Login    Negative
    Dado que o usuário esteja na tela de Login
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-01    Login

    Quando ele preencher os campos de usuario e senha            ${USUARIO_INVALIDO}    ${SENHA_INVALIDO}
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-02    Login

    Então ele NÃO deve ser redirecionado para a página inicial      ${MSG_ERROR_USER}
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-03    Login

QBEF-03 Login Fail - EMPTY Fields
    [Tags]    Login    Negative
    Dado que o usuário esteja na tela de Login
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-01    Login

    Quando ele preencher os campos de usuario e senha            ${EMPTY}               ${EMPTY}
        Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-02    Login

    Então ele NÃO deve ser redirecionado para a página inicial      ${MSG_ERROR_FIELD} 
         Capturar Print Na Pasta Da Funcionalidade    ${TEST NAME} step-03    Login