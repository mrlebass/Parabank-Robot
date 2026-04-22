*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsTransfer.robot

*** Variables ***
${VALOR_TRANSFERENCIA}                                          900
${VALOR_TRANSFERENCIA_NEGATIVO}                                -900
${VALOR_TRANSFERENCIA_VAZIO}                                   ${EMPTY}
${CONTA_ORIGEM}                                                13344
${CONTA_DESTINO}                                               13344
${CONTA_VAZIA}                                                 ${EMPTY}
${VALOR_TRANSFERENCIA_TEXTO}                                   abc

*** Keywords ***       
Accounts Overview
    [Arguments]                      ${conta_origem}            ${conta_destino}           ${quantidade}
    Click Element                    ${BTN_OVERVIEW}
    Esperar elemento visivel    ${PAINEL_DIREITA}          10s
    Esperar elemento visivel    ${TABELA_TRANSFERENCIA}    10s
    Esperar elemento visivel    ${TABLE_ACCOUNT}           10s
    Esperar elemento visivel    ${TABLE_BALANCE}           10s
    # Element Should Contain           ${TABELA_TRANSFERENCIA}    ${conta_origem}            ${conta_destino}          ${quantidade}
    
    ### Sem Sleep: espera a tabela "refletir" os dados ###          Sleep                            5s

    Wait Until Keyword Succeeds      5x    2s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${conta_origem}
    # Wait Until Keyword Succeeds      5x    1s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${conta_destino}
    # Wait Until Keyword Succeeds      5x    2s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${quantidade}


Dado que o usuário esteja na página de transferência
    Esperar elemento visivel    ${TRANSFER_FUNDS}       10s
    Click Element                    ${TRANSFER_FUNDS}
    Esperar elemento visivel    ${AMOUNT_FIELD}         10s

Quando ele preenche os campos de transferência
    [Arguments]    ${conta_origem}    ${conta_destino}    ${quantidade}

    Esperar elemento visivel    ${FROM_ACCOUNT}    10s
    Esperar elemento visivel    ${TO_ACCOUNT}      10s
    Esperar elemento visivel    ${AMOUNT_FIELD}    10s

    ${conta_origem}=     Convert To String    ${conta_origem}
    ${conta_destino}=    Convert To String    ${conta_destino}

    Wait Until Keyword Succeeds    5x    1s    Select From List By Value    ${FROM_ACCOUNT}    ${conta_origem}
    Wait Until Keyword Succeeds    5x    1s    Select From List By Value    ${TO_ACCOUNT}      ${conta_destino}
    Input Text    ${AMOUNT_FIELD}    ${quantidade}

E envia a transferência
    Click Button    ${BTN_TRANSFER}

Então a transferência deve ser realizada corretamente
    Esperar elemento visivel    ${MENSAGEM_SUCESSO}        10s
    Element Should Be Visible        ${MENSAGEM_SUCESSO}

Então a transferência NÃO deve ser realizada
    Esperar elemento visivel    ${MENSAGEM_ERRO2}           10s
    Element Should Be Enabled        ${MENSAGEM_ERRO2}