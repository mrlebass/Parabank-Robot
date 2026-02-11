*** Settings ***
## Resources ##
Resource   ../../Resources/Login/KeywordsLogin.robot

## Libraries ##
Library    OperatingSystem


*** Keywords ***

# Capturar Print Na Pasta Da Funcionalidade
#     [Arguments]    ${nome_arquivo}    ${caminho_da_pasta}
#     ${dir}=    Set Variable    ${EXECDIR}/${caminho_da_pasta}
#     Create Directory    ${dir}
#     Capture Page Screenshot    ${dir}/${nome_arquivo}.png

Capturar Print Na Pasta Da Funcionalidade
    [Arguments]    ${nome_arquivo}    ${feature}=General

    ${dir}=    Set Variable    ${OUTPUT DIR}${/}Evidences${/}${feature}
    Create Directory    ${dir}
    ${file}=   Set Variable    ${dir}${/}${nome_arquivo}.png
    Capture Page Screenshot    ${file}



Esperar Elemento Visivel
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Teardown Padrao
    # Se falhar, salva evidência automática no output do Robot (Results)
    Run Keyword If Test Failed    Capture Page Screenshot    ${OUTPUTDIR}/FAIL_${TEST NAME}.png
    Close Browser


Iniciar Sessao Autenticada
    Dado que eu acesse o site Parabank
    Fazer login com Sucesso

Fazer login com Sucesso
    Dado que o usuário esteja na tela de Login
    Quando ele preencher os campos de usuario e senha  ${USUARIO_VALIDO}    ${SENHA_VALIDO}
    Então ele deve ser redirecionado para a página inicial
