*** Settings ***
## Resources ##
Resource   ../../Resources/Login/KeywordsLogin.robot

## Libraries ##
Library    OperatingSystem
Library    Collections



*** Keywords ***

# ──────────────────────────────────────────────
#  EVIDÊNCIA EM VÍDEO
# ──────────────────────────────────────────────

Iniciar Gravacao De Video
    [Documentation]    Inicia a gravação de vídeo para o test case atual.
    ...                O vídeo será salvo na pasta Evidences/<feature> com o nome do teste.
    [Arguments]    ${feature}=General
    ${dir}=    Set Variable    ${OUTPUT DIR}${/}Evidences${/}${feature}
    Create Directory    ${dir}
    ${filename}=    Set Variable    ${dir}${/}${TEST NAME}.webm
    Start Video Recording    name=${filename}

Parar Gravacao De Video
    [Documentation]    Para a gravação de vídeo e salva o arquivo.
    Stop Video Recording

# ──────────────────────────────────────────────
#  EVIDÊNCIA EM SCREENSHOT
# ──────────────────────────────────────────────

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
    # Para a gravação de vídeo (se estiver ativa)
    Run Keyword And Ignore Error    Parar Gravacao De Video
    # Se falhar, salva evidência automática no output do Robot (Results)
    Run Keyword If Test Failed    Capture Page Screenshot    ${OUTPUTDIR}/FAIL_${TEST NAME}.png
    Close Browser


Iniciar Sessao Autenticada
    [Arguments]    ${feature}=General
    Dado que eu acesse o site Parabank
    Iniciar Gravacao De Video    ${feature}
    Fazer login com Sucesso

Setup Login Com Video
    [Arguments]    ${feature}=General
    Dado que eu acesse o site Parabank
    Iniciar Gravacao De Video    ${feature}

Fazer login com Sucesso
    Dado que o usuário esteja na tela de Login
    Quando ele preencher os campos de usuario e senha  ${USUARIO_VALIDO}    ${SENHA_VALIDO}
    Então ele deve ser redirecionado para a página inicial