*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsUpdateProfile.robot
Resource    ../Transfer/KeywordsTransfer.robot

*** Variables ***
${FIRSTNAME}    Marco
${LASTNAME}     Macedo
${STREET}       Avenida Paulista
${CITY}         São Paulo
${STATE}        SP
${ZIP}          12345
${PHONE}        11999999999

*** Keywords ***

E desejo atualizar as informações do meu perfil
    Wait Until Element Is Visible    ${LINK_PERFIL}
    Click Element    ${LINK_PERFIL}

Dado que o usuário deseja fazer uma atualização cadastral do seu primeiro nome
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral do seu sobrenome
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral da sua rua
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral da sua cidade
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral do seu estado
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral do seu CEP
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

Dado que o usuário deseja fazer uma atualização cadastral do seu telefone
    Fazer login com Sucesso
    E desejo atualizar as informações do meu perfil

#### Caminhos Felizes ####

Quando atualizo o campo primeiro nome corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-41 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_FIRSTNAME}    ${FIRSTNAME}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-41 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo primeiro nome
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-41 step-03    Resources/UpdateProfile/Evidences
  

Quando atualizo o campo sobrenome corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-43 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_LASTNAME}    ${LASTNAME}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-43 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo sobrenome
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-43 step-03    Resources/UpdateProfile/Evidences
  


Quando atualizo o campo rua corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-45 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_STREET}    ${STREET}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-45 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo rua
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-45 step-03    Resources/UpdateProfile/Evidences
  


Quando atualizo o campo cidade corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-47 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_CITY}    ${CITY}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-47 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo cidade
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-47 step-03    Resources/UpdateProfile/Evidences
  


Quando atualizo o campo estado corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-49 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_STATE}    ${STATE}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-49 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo estado
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-49 step-03    Resources/UpdateProfile/Evidences
  


Quando atualizo o campo CEP corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-51 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_ZIP}    ${ZIP}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-51 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo CEP
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-51 step-03    Resources/UpdateProfile/Evidences
  


Quando atualizo o campo telefone corretamente
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-53 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_PHONE}    ${PHONE}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-53 step-02    Resources/UpdateProfile/Evidences
    Click Button    ${BOTAO_SALVAR}

Então o sistema deve atualizar o campo telefone
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-53 step-03    Resources/UpdateProfile/Evidences
  


#### Caminhos Alternativos ####

Quando deixo o campo primeiro nome vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-42 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_FIRSTNAME}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-42 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo primeiro nome
    Element Should Be Visible    ${ERRO_FIRSTNAME}

Quando deixo o campo sobrenome vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-44 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_LASTNAME}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-44 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo sobrenome
    Element Should Be Visible    ${ERRO_LASTNAME}

Quando deixo o campo rua vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-46 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_STREET}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-46 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo rua
    Element Should Be Visible    ${ERRO_STREET}

Quando deixo o campo cidade vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-48 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_CITY}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-48 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo cidade
    Element Should Be Visible    ${ERRO_CITY}

Quando deixo o campo estado vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-50 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_STATE}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-50 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo estado
    Element Should Be Visible    ${ERRO_STATE}

Quando deixo o campo CEP vazio
    Sleep     2s
    Capturar Print Na Pasta Da Funcionalidade    QBEF-52 step-01    Resources/UpdateProfile/Evidences
    Input Text    ${INPUT_ZIP}    ${EMPTY}
    Click Button    ${BOTAO_SALVAR}
    Capturar Print Na Pasta Da Funcionalidade    QBEF-52 step-02    Resources/UpdateProfile/Evidences

Então o sistema deve exibir a mensagem de erro para o campo CEP
    Element Should Be Visible    ${ERRO_ZIP}

# Quando deixo o campo telefone vazio
#     Sleep     2s
#     Capturar Print Na Pasta Da Funcionalidade    QBEF-54 step-01    Resources/UpdateProfile/Evidences
#     Input Text    ${INPUT_PHONE}    ${EMPTY}
#     Click Button    ${BOTAO_SALVAR}
#     Capturar Print Na Pasta Da Funcionalidade    QBEF-54 step-02    Resources/UpdateProfile/Evidences

# Então o sistema deve exibir a mensagem de erro para o campo telefone
#     Element Should Be Visible    ${ERRO_PHONE}
