*** Settings ***
Resource           ../../Settings/main.robot
Resource           KeywordsOpenNewAccount.robot
Test Setup         Dado que eu acesse o site Parabank
Test Teardown      Teardown Padrao

*** Test Cases ***
QBEF-01 Abertura bem-sucedida de uma nova conta
    [Tags]    new-account    Positive
    Dado que o usuário está na página de abertura de conta
    Quando ele solicita a criação de uma nova conta do tipo SAVINGS
    Então a conta deve ser criada com sucesso
    E o número da nova conta deve ser exibido
