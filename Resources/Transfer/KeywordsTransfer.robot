*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsTransfer.robot

*** Variables ***
${VALOR_TRANSFERENCIA}                                          900
${VALOR_TRANSFERENCIA_NEGATIVO}                                -900
${VALOR_TRANSFERENCIA_VAZIO}                                   ${EMPTY}
${CONTA_ORIGEM}                                                13344
${CONTA_DESTINO}                                               13344
${VALOR_TEXTO}                                                 abc

*** Keywords ***
Dado que o usuário esteja na página de transferência
    Fazer login com Sucesso
    Wait Until Element Is Visible    ${BTN_TRANSFERENCIA}       10s
    Click Element                    ${BTN_TRANSFERENCIA}
    Wait Until Element Is Visible    ${CAMPO_QUANTIDADE}        10s
    Capturar Print Na Pasta Da Funcionalidade      QBEF-21 step-01     Resources/Transfer/Evidences
   

E preencher os campos de transferência com os dados completos
    [Arguments]    ${conta_origem}    ${conta_destino}    ${quantidade}

    # Se origem=destino (ou vierem iguais), escolhe dinamicamente duas contas distintas
    IF    '${conta_origem}' == '${conta_destino}'
        ${conta_origem}    ${conta_destino}=    Obter Contas Distintas
    END

    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_ORIGEM}     ${conta_origem}
    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_DESTINO}    ${conta_destino}

    Clear Element Text    ${CAMPO_QUANTIDADE}
    Input Text            ${CAMPO_QUANTIDADE}    ${quantidade}

    Capturar Print Na Pasta Da Funcionalidade    QBEF-21 step-02    Resources/Transfer/Evidences
    [Return]    ${conta_origem}    ${conta_destino}


E preencher os campos de transferência com um dos dados vazios
    [Arguments]    ${conta_origem}    ${conta_destino}    ${quantidade}

    # Se origem=destino, corrige dinamicamente (evita flakiness e regra inválida)
    IF    '${conta_origem}' == '${conta_destino}'
        ${conta_origem}    ${conta_destino}=    Obter Contas Distintas
    END

    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_ORIGEM}     ${conta_origem}
    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_DESTINO}    ${conta_destino}

    # Para caso "vazio", não preenche (só limpa)
    Clear Element Text    ${CAMPO_QUANTIDADE}
    IF    '${quantidade}' != '' and '${quantidade}' != '${EMPTY}'
        Input Text    ${CAMPO_QUANTIDADE}    ${quantidade}
    END

    Capturar Print Na Pasta Da Funcionalidade    QBEF-22 step-02    Resources/Transfer/Evidences


E preencher os campos de transferência com o dado de valor negativo
    [Arguments]    ${conta_origem}    ${conta_destino}    ${quantidade}

    IF    '${conta_origem}' == '${conta_destino}'
        ${conta_origem}    ${conta_destino}=    Obter Contas Distintas
    END

    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_ORIGEM}     ${conta_origem}
    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_DESTINO}    ${conta_destino}

    Clear Element Text    ${CAMPO_QUANTIDADE}
    Input Text            ${CAMPO_QUANTIDADE}    ${quantidade}

    Capturar Print Na Pasta Da Funcionalidade    QBEF-23 step-02    Resources/Transfer/Evidences


E preencher os campos de transferência com o dado de valor em texto
    [Arguments]    ${conta_origem}    ${conta_destino}    ${quantidade}

    IF    '${conta_origem}' == '${conta_destino}'
        ${conta_origem}    ${conta_destino}=    Obter Contas Distintas
    END

    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_ORIGEM}     ${conta_origem}
    Selecionar Valor Ou Label Do Select    ${OPTION_CONTA_DESTINO}    ${conta_destino}

    Clear Element Text    ${CAMPO_QUANTIDADE}
    Input Text            ${CAMPO_QUANTIDADE}    ${quantidade}

    Capturar Print Na Pasta Da Funcionalidade    QBEF-24 step-02    Resources/Transfer/Evidences
 


Selecionar Valor Ou Label Do Select
    [Arguments]    ${locator}    ${valor}
    ${status}    ${msg}=    Run Keyword And Ignore Error    Select From List By Value    ${locator}    ${valor}
    IF    '${status}' == 'FAIL'
        Select From List By Label    ${locator}    ${valor}
    END

Obter Contas Distintas
    # Pega 2 contas diferentes a partir do select de ORIGEM
    @{opcoes}=    Get List Items    ${OPTION_CONTA_ORIGEM}
    Length Should Be True    ${opcoes}    1

    ${conta_origem}=    Set Variable    ${opcoes}[0]
    ${conta_destino}=   Set Variable    ${None}

    FOR    ${opt}    IN    @{opcoes}
        IF    '${opt}' != '${conta_origem}'
            ${conta_destino}=    Set Variable    ${opt}
            Exit For Loop
        END
    END

    Should Not Be Equal    ${conta_destino}    ${None}    Só existe 1 conta disponível. Não é possível transferir entre contas distintas.
    [Return]    ${conta_origem}    ${conta_destino}

Quando eu envio a transferência
    Click Button    ${BTN_TRANSFERIR}
  

Então deve mostrar uma mensagem de sucesso
    Wait Until Element Is Visible    ${MENSAGEM_SUCESSO}        10s
    Element Should Be Visible        ${MENSAGEM_SUCESSO}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-21 step-03     Resources/Transfer/Evidences
       
E a tranferência deve ser registrada
    [Arguments]                      ${conta_origem}            ${conta_destino}           ${quantidade}
    Click Element                    ${BTN_OVERVIEW}
    Wait Until Element Is Visible    ${PAINEL_DIREITA}          10s
    Wait Until Element Is Visible    ${TABELA_TRANSFERENCIA}    10s
    # Sleep                            5s
    # Element Should Contain           ${TABELA_TRANSFERENCIA}    ${conta_origem}            ${conta_destino}          ${quantidade}
    # Capturar Print Na Pasta Da Funcionalidade      QBEF-21 step-04     Resources/Transfer/Evidences
    
    # Sem Sleep: espera a tabela "refletir" os dados
    Wait Until Keyword Succeeds      5x    1s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${conta_origem}
    Wait Until Keyword Succeeds      5x    1s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${conta_destino}
    Wait Until Keyword Succeeds      5x    1s    Element Should Contain    ${TABELA_TRANSFERENCIA}    ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-21 step-04     Resources/Transfer/Evidences

Então deve mostrar uma mensagem de erro pra transferência
    Wait Until Element Is Visible    ${MENSAGEM_ERRO2}           10s
    Element Should Be Visible    ${MENSAGEM_ERRO2}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-21 step-04     Resources/Transfer/Evidences

Então deve mostrar uma mensagem de erro pra transferência de campos vazios
    Wait Until Element Is Visible    ${MENSAGEM_ERRO2}           10s
    Element Should Be Visible    ${MENSAGEM_ERRO2}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-22 step-04     Resources/Transfer/Evidences

Então deve mostrar uma mensagem de erro pra transferência de valor negativo
    Wait Until Element Is Visible    ${MENSAGEM_ERRO2}           10s
    Element Should Be Visible    ${MENSAGEM_ERRO2}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-23 step-04     Resources/Transfer/Evidences

Então deve mostrar uma mensagem de erro pra transferência de valor em texto
    Wait Until Element Is Visible    ${MENSAGEM_ERRO2}           10s
    Element Should Be Visible    ${MENSAGEM_ERRO2}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-24 step-04     Resources/Transfer/Evidences
