*** Settings ***
Resource           ../../Settings/main.robot
Resource           KeywordsBillPay.robot
Test Setup         Dado que eu acesse o site Parabank
Test Teardown     Teardown Padrao

*** Test Cases ***
QBEF-30 Pagamento de contas com sucesso
    [Tags]    BillPay    Positive
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com os dados completos        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de sucesso

QBEF-31 Pagamento de contas com o dado de nome vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de nome vazio        ${EMPTY}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com o nome vazio

QBEF-32 Pagamento de contas com o dado de endereço incompleto
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de endereço incompleto        ${VALOR_NOME_PAYEE}    ${EMPTY}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com o endereço incompleto

QBEF-33 Pagamento de contas com o dado de cidade vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de cidade vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${EMPTY}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com a cidade vazia

QBEF-34 Pagamento de contas com o dado de estado vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de estado vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${EMPTY}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com o estado vazio

QBEF-35 Pagamento de contas com o dado de CEP vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de CEP vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${EMPTY}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com o CEP vazio

QBEF-36 Pagamento de contas com o dado de telefone vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de telefone vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${EMPTY}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com o telefone vazio

QBEF-37 Pagamento de contas com o dado de conta vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de conta vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${EMPTY}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com a conta vazia


QBEF-38 Pagamento de contas com o dado de verificar conta vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de verificar conta vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${EMPTY}    ${VALOR_QUANTIDADE}
    Então deve mostrar uma mensagem de erro com a verificar conta vazia

QBEF-39 Pagamento de contas com o dado de quantidade vazio
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
    E preencher os campos de pagamento com o dado de quantidade vazio        ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${EMPTY}
    Então deve mostrar uma mensagem de erro com a quantidade vazia