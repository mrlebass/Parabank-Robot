*** Settings ***
Resource           ../../Settings/main.robot
Resource           KeywordsOpenNewAccount.robot
Test Teardown      Teardown Padrao

*** Test Cases ***
QBEF-10 Open New Account
    [Tags]    new-account    Positive
    [Setup]    Iniciar Sessao Autenticada    OpenNewAccount
    Dado que o usuário está na página de abertura de conta
    Quando ele solicita a criação de uma nova conta do tipo SAVINGS
    Então a conta deve ser criada com sucesso
