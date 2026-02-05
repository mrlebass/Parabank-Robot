*** Settings ***
Resource             ../../Settings/main.robot
Resource             KeywordsUpdateProfile.robot
Resource             ../OpenNewAccount/KeywordsOpenNewAccount.robot
Test Setup           Dado que eu acesse o site Parabank
Test Teardown        Teardown Padrao


*** Test Cases ***

QBEF - 01 Tentativa de atualizar o perfil com preenchimento correto do primeiro nome
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral do seu primeiro nome
    Quando atualizo o campo primeiro nome corretamente
    Então o sistema deve atualizar o campo primeiro nome
    
QBEF - 02 Tentativa de atualização com campo Primeiro Nome vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral do seu primeiro nome
    Quando deixo o campo primeiro nome vazio
    Então o sistema deve exibir a mensagem de erro para o campo primeiro nome

QBEF - 03 Tentativa de atualizar o perfil com preenchimento correto do sobrenome
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral do seu sobrenome
    Quando atualizo o campo sobrenome corretamente
    Então o sistema deve atualizar o campo sobrenome
    
QBEF - 04 Tentativa de atualização com campo Sobrenome vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral do seu sobrenome
    Quando deixo o campo sobrenome vazio
    Então o sistema deve exibir a mensagem de erro para o campo sobrenome

QBEF - 05 Tentativa de atualizar o perfil com preenchimento correto da rua
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral da sua rua
    Quando atualizo o campo rua corretamente
    Então o sistema deve atualizar o campo rua
    
QBEF - 06 Tentativa de atualização com campo Rua vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral da sua rua
    Quando deixo o campo rua vazio
    Então o sistema deve exibir a mensagem de erro para o campo rua

QBEF - 07 Tentativa de atualizar o perfil com preenchimento correto da cidade
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral da sua cidade
    Quando atualizo o campo cidade corretamente
    Então o sistema deve atualizar o campo cidade
    

QBEF - 08 Tentativa de atualização com campo Cidade vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral da sua cidade
    Quando deixo o campo cidade vazio
    Então o sistema deve exibir a mensagem de erro para o campo cidade

QBEF - 09 Tentativa de atualizar o perfil com preenchimento correto do estado
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral do seu estado
    Quando atualizo o campo estado corretamente
    Então o sistema deve atualizar o campo estado
    
QBEF - 10 Tentativa de atualização com campo Estado vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral do seu estado
    Quando deixo o campo estado vazio
    Então o sistema deve exibir a mensagem de erro para o campo estado

QBEF - 11 Tentativa de atualizar o perfil com preenchimento correto do CEP
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral do seu CEP
    Quando atualizo o campo CEP corretamente
    Então o sistema deve atualizar o campo CEP
    
QBEF - 12 Tentativa de atualização com campo CEP vazio
    [Tags]    update-profile    Negative
    Dado que o usuário deseja fazer uma atualização cadastral do seu CEP
    Quando deixo o campo CEP vazio
    Então o sistema deve exibir a mensagem de erro para o campo CEP

QBEF - 13 Tentativa de atualizar o perfil com preenchimento correto do telefone
    [Tags]    update-profile    Positive
    Dado que o usuário deseja fazer uma atualização cadastral do seu telefone
    Quando atualizo o campo telefone corretamente
    Então o sistema deve atualizar o campo telefone
    
# QBEF - 14 Tentativa de atualização com campo Telefone vazio
#     [Tags]    update-profile    Negative
#     Dado que o usuário deseja fazer uma atualização cadastral do seu telefone
#     Quando deixo o campo telefone vazio
#     Então o sistema deve exibir a mensagem de erro para o campo telefone
