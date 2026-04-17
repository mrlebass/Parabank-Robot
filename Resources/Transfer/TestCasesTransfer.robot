*** Settings ***
Resource            ../../Settings/main.robot
Resource            KeywordsTransfer.robot   
Test Teardown       Teardown Padrao

*** Test Cases ***
QBEF-21 Transfer Funds Sucess
    [Tags]    Transfer    Positive
    [Setup]    Iniciar Sessao Autenticada    Transfer
    Dado que o usuário esteja na página de transferência
    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}
    E envia a transferência
    Então a transferência deve ser realizada corretamente
    Accounts Overview                                       ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}


QBEF-22 Transfer Funds Error - value empty
    [Tags]    Transfer    Negative
    [Setup]    Iniciar Sessao Autenticada    Transfer
    Dado que o usuário esteja na página de transferência
    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_VAZIO}
    E envia a transferência
    Então a transferência NÃO deve ser realizada


# QBEF-23 Transfer Funds Negative value
#     [Tags]    Transfer    Negative
#     [Setup]    Iniciar Sessao Autenticada    Transfer
#     Dado que o usuário esteja na página de transferência
#     Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_NEGATIVO}
#     E envia a transferência
#     Então a transferência NÃO deve ser realizada


QBEF-24 Transfer Funds Negative value
    [Tags]    Transfer    Negative
    [Setup]    Iniciar Sessao Autenticada    Transfer
    Dado que o usuário esteja na página de transferência
    Quando ele preenche os campos de transferência          ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_TEXTO}
    E envia a transferência
    Então a transferência NÃO deve ser realizada
