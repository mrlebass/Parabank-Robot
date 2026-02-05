*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsLogin.robot   
Test Setup           Dado que eu acesse o site Parabank
Test Teardown        Teardown Padrao


*** Test Cases ***
QBEF-01 Login com sucesso
    [Tags]    Login    Positive
    Dado que o usuário esteja na tela de Login
    Quando o usuário preencher os campos de usuario e senha           ${USUARIO_VALIDO}    ${SENHA_VALIDO}
    Então deve ser redirecionado para a página inicial

QBEF-02 Login com falha
    [Tags]    Login    Negative
    Dado que o usuário esteja na tela de Login
    Quando o usuário preencher os campos de usuario e senha inválidos            ${USUARIO_INVALIDO}    ${SENHA_INVALIDO}
    Então deve ver uma mensagem de erro de login

QBEF-03 Login com campos vazios
    [Tags]    Login    Negative
    Dado que o usuário esteja na tela de Login
    Quando o usuário preencher os campos de usuario e senha vazios             ${EMPTY}               ${EMPTY}
    Então deve ver uma mensagem de erro de campos vazios