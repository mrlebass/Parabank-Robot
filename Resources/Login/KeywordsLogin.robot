*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsLogin.robot

*** Variables ***
${USUARIO_VALIDO}                    john
${SENHA_VALIDO}                      demo
${USUARIO_INVALIDO}                  teste
${SENHA_INVALIDO}                    teste
${MSG_ERROR_USER}                    The username and password could not be verified.        
${MSG_ERROR_FIELD}                   Please enter a username and password.

*** Keywords ***
Dado que o usuário esteja na tela de Login
    Wait Until Element Is Visible    ${CAMPO_USUARIO}          10s
    Element Should Be Visible        ${CAMPO_USUARIO}          
    Wait Until Element Is Visible    ${CAMPO_SENHA}            10s
    Element Should Be Visible        ${CAMPO_SENHA}

Quando ele preencher os campos de usuario e senha
    [Arguments]                      ${usuario}                ${senha}
    Input Text                       ${CAMPO_USUARIO}          ${usuario}
    Input Text                       ${CAMPO_SENHA}            ${senha}
    Click Button                     ${BOTAO_LOGIN}

Então ele deve ser redirecionado para a página inicial
    Wait Until Element Is Visible    ${BTN_LOGOUT}             10s
    Element Should Be Visible        ${BTN_LOGOUT}
    Wait Until Element Is Visible    ${TABELA_TRANSFERENCIA}   10s
    Element Should Be Visible        ${TABELA_TRANSFERENCIA}

Então ele NÃO deve ser redirecionado para a página inicial
    [Arguments]                      ${message_error}
    Wait Until Element Is Visible    ${MSG_ERROR_LOGIN}         10s
    Element Should Be Enabled        ${MSG_ERROR_LOGIN}
    Element Should Contain           ${MSG_ERROR_LOGIN}        ${message_error}

