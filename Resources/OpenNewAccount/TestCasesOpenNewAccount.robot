*** Settings ***
Resource           ../../Settings/main.robot
Resource           KeywordsOpenNewAccount.robot
Test Setup         Iniciar Sessao Autenticada
Test Teardown      Teardown Padrao

*** Test Cases ***
QBEF-10 Open New Account
    [Tags]    new-account    Positive
    Dado que o usuário está na página de abertura de conta
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-01  OpenNewAccount

    Quando ele solicita a criação de uma nova conta do tipo SAVINGS
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-02   OpenNewAccount

    Então a conta deve ser criada com sucesso
        Capturar Print Na Pasta Da Funcionalidade                   ${TEST NAME} step-03   OpenNewAccount