*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsLogin.robot   
Test Teardown        Teardown Padrao


*** Test Cases ***
QBEF-01 Login Sucess
    [Tags]    Login    Positive
    [Setup]    Setup Login Com Video    Login
    Dado que o usuário esteja na tela de Login
    Quando ele preencher os campos de usuario e senha           ${USUARIO_VALIDO}    ${SENHA_VALIDO}
    Então ele deve ser redirecionado para a página inicial


QBEF-02 Login Fail
    [Tags]    Login    Negative
    [Setup]    Setup Login Com Video    Login
    Dado que o usuário esteja na tela de Login
    Quando ele preencher os campos de usuario e senha            ${USUARIO_INVALIDO}    ${SENHA_INVALIDO}
    Então ele NÃO deve ser redirecionado para a página inicial      ${MSG_ERROR_USER}

QBEF-03 Login Fail - EMPTY Fields
    [Tags]    Login    Negative
    [Setup]    Setup Login Com Video    Login
    Dado que o usuário esteja na tela de Login
    Quando ele preencher os campos de usuario e senha            ${EMPTY}               ${EMPTY}
    Então ele NÃO deve ser redirecionado para a página inicial      ${MSG_ERROR_FIELD}
