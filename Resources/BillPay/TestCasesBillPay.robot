*** Settings ***
Resource            ../../Settings/main.robot
Resource            KeywordsBillPay.robot
Test Setup          Iniciar Sessao Autenticada
Test Teardown       Teardown Padrao

*** Test Cases ***
QBEF-30 Bill Pay SUCESS
    [Tags]    BillPay    Positive
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-02     BillPay 
    
    Então o pagamento deve ser realizado
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-03     BillPay 

QBEF-31 Bill Pay FAIL - Not name field
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-01     BillPay
    
    Quando ele preenche os campos de pagamento                  ${EMPTY}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-02     BillPay
    
    Então o pagamento NÃO deve ser realizado devido ao campo nome não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-03     BillPay

QBEF-32 Bill Pay FAIL - Incomplete address
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${EMPTY}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-02     BillPay

    Então o pagamento NÃO deve ser realizado devido ao campo endereço não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-03     BillPay

QBEF-33 Bill Pay FAIL - Not city
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${EMPTY}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-02     BillPay
    
    Então o pagamento NÃO deve ser realizado devido ao campo cidade não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-03     BillPay

QBEF-34 Bill Pay FAIL - Not State
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-01     BillPay
        
    Quando ele preenche os campos de pagamento                  ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${EMPTY}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-02     BillPay
    
    Então o pagamento NÃO deve ser realizado devido ao campo estado não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade               ${TEST NAME} step-03     BillPay

QBEF-35 Bill Pay FAIL - Not ZIP CODE 
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                      ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${EMPTY}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     BillPay

    Então o pagamento NÃO deve ser realizado devido ao campo CEP não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     BillPay

QBEF-36 Bill Pay FAIL - Not Phone Number
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     BillPay


    Quando ele preenche os campos de pagamento                      ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${EMPTY}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     BillPay

    Então o pagamento NÃO deve ser realizado devido ao campo telefone não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     BillPay

QBEF-37 Bill Pay FAIL - Not Account
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                      ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${EMPTY}    ${VALOR_VERIFICAR_CONTA}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     BillPay
    
    Então o pagamento NÃO deve ser realizado devido ao campo conta não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     BillPay

QBEF-38 Bill Pay FAIL - Check Account Empty
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                       ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${EMPTY}    ${VALOR_QUANTIDADE}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     BillPay

    Então o pagamento NÃO deve ser realizado devido ao campo verificar conta não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     BillPay

QBEF-39 Bill Pay FAIL - Not Value
    [Tags]    BillPay    Negative
    Dado que o usuário esteja na página de pagamento de contas
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01     BillPay

    Quando ele preenche os campos de pagamento                      ${VALOR_NOME_PAYEE}    ${VALOR_ENDERECO}    ${VALOR_CIDADE}    ${VALOR_ESTADO}    ${VALOR_CEP}    ${VALOR_TELEFONE}    ${VALOR_CONTA}    ${VALOR_VERIFICAR_CONTA}    ${EMPTY}
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02     BillPay

    Então o pagamento NÃO deve ser realizado devido ao campo quantidade não estar preenchido
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03     BillPay