*** Settings ***
Resource            ../../Settings/main.robot
Resource            KeywordsBillPay.robot
Test Teardown       Teardown Padrao

*** Test Cases ***
QBEF-30 Bill Pay SUCESS
    [Tags]    BillPay    Positive
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento deve ser realizado

QBEF-31 Bill Pay FAIL - Not name field
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${EMPTY}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_NOME}

QBEF-32 Bill Pay FAIL - Incomplete address
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${EMPTY}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_ENDERECO}

QBEF-33 Bill Pay FAIL - Not city
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${EMPTY}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_CIDADE}

QBEF-34 Bill Pay FAIL - Not State
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${EMPTY}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_ESTADO}

QBEF-35 Bill Pay FAIL - Not ZIP CODE
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${EMPTY}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_CEP}

QBEF-36 Bill Pay FAIL - Not Phone Number
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${EMPTY}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_TELEFONE}

QBEF-37 Bill Pay FAIL - Not Account
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${EMPTY}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_CONTA}

QBEF-38 Bill Pay FAIL - Check Account Empty
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${EMPTY}    ${VALOR_QUANTIDADE}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_VERIFICAR_CONTA}

QBEF-39 Bill Pay FAIL - Not Value
    [Tags]    BillPay    Negative
    [Setup]    Iniciar Sessao Autenticada    BillPay
    Dado que o usuário esteja na página de pagamento de contas
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${EMPTY}
    Então o pagamento NÃO deve ser realizado devido ao campo obrigatório    ${MENSAGEM_ERRO_QUANTIDADE}