*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsTransfer.robot   
Test Setup        Dado que eu acesse o site Parabank
Test Teardown     Teardown Padrao

*** Test Cases ***
QBEF-21 Tranferência com sucesso
    [Tags]    Transfer    Positive
    Dado que o usuário esteja na página de transferência
    E preencher os campos de transferência com os dados completos        ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}
    Então deve mostrar uma mensagem de sucesso
    E a tranferência deve ser registrada                       ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA}

QBEF-22 Tranferência sem dado de valor
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
    E preencher os campos de transferência com um dos dados vazios        ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_VAZIO}  
    Então deve mostrar uma mensagem de erro pra transferência de campos vazios

QBEF-23 Transferência com valor negativo
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
    E preencher os campos de transferência com o dado de valor negativo        ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${VALOR_TRANSFERENCIA_NEGATIVO}
    Então deve mostrar uma mensagem de erro pra transferência de valor negativo

QBEF-24 Transferência com conta valor em Texto
    [Tags]    Transfer    Negative
    Dado que o usuário esteja na página de transferência
    E preencher os campos de transferência com o dado de valor em texto        ${CONTA_ORIGEM}    ${CONTA_DESTINO}    ${USUARIO_INVALIDO}
    Então deve mostrar uma mensagem de erro pra transferência de valor em texto