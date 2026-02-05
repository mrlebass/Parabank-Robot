*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsOpenNewAccount.robot

*** Variables ***
${TIPO_CONTA}    SAVINGS

*** Keywords ***

Dado que o usuário está na página de abertura de conta
    Fazer login com Sucesso
    Wait Until Element Is Visible    ${LINK_NOVA_CONTA}
    Click Element    ${LINK_NOVA_CONTA}
    Sleep       2s
    ${PRIMEIRA_OPCAO_CONTA}=    Get Text    ${SELECT_TIPO_CONTA}/option[1]  
    Should Be Equal    ${PRIMEIRA_OPCAO_CONTA}    CHECKING
    Capturar Print Na Pasta Da Funcionalidade     QBEF-11 step-01  Resources/OpenNewAccount/Evidences
    Wait Until Element Is Visible    ${SELECT_TIPO_CONTA}
    

Quando ele solicita a criação de uma nova conta do tipo SAVINGS
    Select From List By Label    ${SELECT_TIPO_CONTA}    ${TIPO_CONTA}
    Sleep    2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-12 step-02   Resources/OpenNewAccount/Evidences
    Click Button    ${BOTAO_ABRIR_CONTA}

Então a conta deve ser criada com sucesso
    Wait Until Element Is Visible    ${MENSAGEM_SUCESSO_CONTA}    10s
    Element Should Be Visible        ${MENSAGEM_SUCESSO_CONTA}
    

E o número da nova conta deve ser exibido
    Wait Until Element Is Visible    ${NUMERO_NOVA_CONTA}
    Element Should Be Visible        ${NUMERO_NOVA_CONTA}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-13 step-03   Resources/OpenNewAccount/Evidences