*** Settings ***
Resource            ../../Settings/main.robot
Resource            KeywordsTransfer.robot   
Test Setup          Iniciar Sessao Autenticada
Test Teardown       Teardown Padrao

*** Test Cases ***
QBEF-21 Transfer Funds Sucess
    [Tags]    Transfer    Positive
    Dado que o usuário esteja na página de transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-01     Transfer       
    
    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-02    Transfer

    E envia a transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-03     Transfer

    Então a transferência deve ser realizada corretamente
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-04     Transfer
        
    Accounts Overview                                       ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-05     Transfer


QBEF-22 Transfer Funds Error - value empty
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-01     Transfer

    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_VAZIO}
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-02     Transfer

    E envia a transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-03     Transfer

    Então a transferência NÃO deve ser realizada
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-04     Transfer


QBEF-23 Transfer Funds Negative value
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-01     Transfer

    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_NEGATIVO}
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-02     Transfer

    E envia a transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-03     Transfer

    Então a transferência NÃO deve ser realizada
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-04     Transfer


QBEF-24 Transfer Funds Negative value
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-01     Transfer

    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_TEXTO}
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-02     Transfer

    E envia a transferência
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-03     Transfer

    Então a transferência NÃO deve ser realizada
        Capturar Print Na Pasta Da Funcionalidade           ${TEST NAME} step-04     Transfer