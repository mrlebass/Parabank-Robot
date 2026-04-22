*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsUpdateProfile.robot
Resource    ../Transfer/KeywordsTransfer.robot

*** Variables ***
${FIRSTNAME}    Leandro
${LASTNAME}     Estevao
${STREET}       Avenida Paulista
${CITY}         São Paulo
${STATE}        SP
${ZIP}          03080
${PHONE}        1197070096

*** Keywords ***

Dado que o usuário esteja na tela de atualização cadastral
    Wait Until Element Is Visible    ${LINK_PERFIL}     10s
    Click Element    ${LINK_PERFIL}
    Wait Until Element Is Visible    ${PAINEL_PROFILE}  10s

Quando ele realiza a atualização cadastral do campo first name
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_FIRSTNAME} 
    Input Text              ${INPUT_FIRSTNAME}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo last name
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_LASTNAME} 
    Input Text              ${INPUT_LASTNAME}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo address
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_STREET} 
    Input Text              ${INPUT_STREET}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo city
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_CITY} 
    Input Text              ${INPUT_CITY}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo state
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_STATE} 
    Input Text              ${INPUT_STATE}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo zipcode
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_ZIP} 
    Input Text              ${INPUT_ZIP}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Quando ele realiza a atualização cadastral do campo phone number
    [Arguments]             ${field_upload}
    Clear Element Text      ${INPUT_PHONE} 
    Input Text              ${INPUT_PHONE}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Então o sistema deve realizar a atualização do campo
    Wait Until Element Is Visible    ${CONFIRMAÇÃO_ATUALIZAÇÃO}

Quando ele realiza a atualização cadastral inválida
    [Arguments]             ${first_name}   ${last_name}    ${street}   ${city}   ${state}    ${zip}
    Input Text              ${INPUT_FIRSTNAME}    ${first_name}
    Input Text              ${INPUT_LASTNAME}     ${last_name}
    Input Text              ${INPUT_STREET}       ${street}
    Input Text              ${INPUT_CITY}         ${city}
    Input Text              ${INPUT_STATE}        ${state}
    Input Text              ${INPUT_ZIP}          ${zip}
    Click Button            ${BOTAO_SALVAR}       

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo fisrt name
    Element Should Be Visible    ${ERRO_FIRSTNAME}

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo last name
    Element Should Be Visible    ${ERRO_LASTNAME}

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo street
    Element Should Be Visible    ${ERRO_STREET}

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo city
    Element Should Be Visible    ${ERRO_CITY}


Então o sistema NÃO deve realizar a atualização e apresentar erro do campo state
    Element Should Be Visible    ${ERRO_STATE}

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo zipcode
    Element Should Be Visible    ${ERRO_ZIP}


#     Input Text    ${INPUT_PHONE}      ${phone}
# Então o sistema NÃO deve realizar a atualização e apresentar erro do campo phone number
#     Element Should Be Visible    ${ERRO_PHONE}
