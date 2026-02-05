*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsLogin.robot

*** Variables ***
${USUARIO_VALIDO}                    john
${SENHA_VALIDO}                      demo
${USUARIO_INVALIDO}                  teste
${SENHA_INVALIDO}                    teste

*** Keywords ***

Dado que o usuário esteja na tela de Login
    Wait Until Element Is Visible    ${CAMPO_USUARIO}          10s
    Element Should Be Visible        ${CAMPO_USUARIO}          
    Wait Until Element Is Visible    ${CAMPO_SENHA}            10s
    Element Should Be Visible        ${CAMPO_SENHA}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-01 step-01    Resources/Login/Evidences

Quando o usuário preencher os campos de usuario e senha
    [Arguments]                      ${usuario}                ${senha}
    Input Text                       ${CAMPO_USUARIO}          ${usuario}
    Input Text                       ${CAMPO_SENHA}            ${senha}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-01 step-02     Resources/Login/Evidences
    Click Button                     ${BOTAO_LOGIN}

Quando o usuário preencher os campos de usuario e senha inválidos
    [Arguments]                      ${usuario}                ${senha}
    Input Text                       ${CAMPO_USUARIO}          ${usuario}
    Input Text                       ${CAMPO_SENHA}            ${senha}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-02 step-02     Resources/Login/Evidences
    Click Button                     ${BOTAO_LOGIN}

Quando o usuário preencher os campos de usuario e senha vazios
    [Arguments]                      ${usuario}                ${senha}
    Input Text                       ${CAMPO_USUARIO}          ${usuario}
    Input Text                       ${CAMPO_SENHA}            ${senha}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-03 step-02     Resources/Login/Evidences
    Click Button                     ${BOTAO_LOGIN}

Então deve ser redirecionado para a página inicial
    Wait Until Element Is Visible    ${BTN_LOGOUT}             10s
    Element Should Be Visible        ${BTN_LOGOUT}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-01 step-03     Resources/Login/Evidences

Então deve ver uma mensagem de erro de login
    Wait Until Element Is Visible    ${MENSAGEM_ERRO1}         10s
    Element Should Be Enabled        ${MENSAGEM_ERRO1}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-02 step-03     Resources/Login/Evidences

Então deve ver uma mensagem de erro de campos vazios
    Wait Until Element Is Visible    ${MENSAGEM_ERRO1}         10s
    Element Should Be Enabled        ${MENSAGEM_ERRO1}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-03 step-03     Resources/Login/Evidences