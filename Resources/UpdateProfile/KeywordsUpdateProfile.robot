*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsUpdateProfile.robot
Resource    ../Transfer/KeywordsTransfer.robot
Resource    ../Common/Common.robot

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
    Esperar Elemento visivel   ${LINK_PERFIL}     10s
    Click Element    ${LINK_PERFIL}
    Esperar Elemento visivel   ${PAINEL_PROFILE}  10s

Quando ele realiza a atualização cadastral de um campo
    [Arguments]             ${locator_campo}    ${field_upload}
    Clear Element Text      ${locator_campo}
    Input Text              ${locator_campo}    ${field_upload}
    Click Button            ${BOTAO_SALVAR}

Então o sistema deve realizar a atualização do campo
    Esperar Elemento visivel   ${CONFIRMAÇÃO_ATUALIZAÇÃO}

Quando ele realiza a atualização cadastral inválida
    [Arguments]             ${first_name}   ${last_name}    ${street}   ${city}   ${state}    ${zip}
    Input Text              ${INPUT_FIRSTNAME}    ${first_name}
    Input Text              ${INPUT_LASTNAME}     ${last_name}
    Input Text              ${INPUT_STREET}       ${street}
    Input Text              ${INPUT_CITY}         ${city}
    Input Text              ${INPUT_STATE}        ${state}
    Input Text              ${INPUT_ZIP}          ${zip}
    Click Button            ${BOTAO_SALVAR}

Então o sistema NÃO deve realizar a atualização e apresentar erro do campo obrigatório
    [Arguments]    ${locator_erro}
    Element Should Be Visible    ${locator_erro}
