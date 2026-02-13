*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsOpenNewAccount.robot

*** Variables ***
${TIPO_CONTA}           SAVINGS

*** Keywords ***

Dado que o usuário está na página de abertura de conta
    Wait Until Element Is Visible    ${LINK_NOVA_CONTA}
    Click Element    ${LINK_NOVA_CONTA}
    ${PRIMEIRA_OPCAO_CONTA}=    Get Text    ${SELECT_TIPO_CONTA}/option[1]  
    Should Be Equal    ${PRIMEIRA_OPCAO_CONTA}    CHECKING
    Wait Until Element Is Visible    ${SELECT_TIPO_CONTA}
    

Quando ele solicita a criação de uma nova conta do tipo SAVINGS
    Select From List By Label    ${SELECT_TIPO_CONTA}    ${TIPO_CONTA}
    Click Button    ${BOTAO_ABRIR_CONTA}

Então a conta deve ser criada com sucesso
    Wait Until Element Is Visible    ${MENSAGEM_SUCESSO_CONTA}    10s
    Element Should Be Visible        ${MENSAGEM_SUCESSO_CONTA}
    
    Wait Until Element Is Visible    ${NUMERO_NOVA_CONTA}         10s
    Element Should Be Visible        ${NUMERO_NOVA_CONTA}       
    
    ${newAccountId}=    Get Text    ${NUMERO_NOVA_CONTA}
    Should Match Regexp    ${newAccountId}    ^\\d+$


