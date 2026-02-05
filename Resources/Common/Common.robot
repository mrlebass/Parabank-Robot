*** Settings ***
Resource             ../../Settings/main.robot
Resource             ../../Resources/Login/KeywordsLogin.robot

*** Keywords ***
Capturar Print Na Pasta Da Funcionalidade
    [Arguments]    ${nome_arquivo}    ${caminho_da_pasta}
    Capture Page Screenshot     ${EXECDIR}/${caminho_da_pasta}/${nome_arquivo}.png

Esperar Elemento Visivel
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}

Teardown Padrao
    # Se falhar, salva evidência automática no output do Robot (Results)
    Run Keyword If Test Failed    Capture Page Screenshot    ${OUTPUTDIR}/FAIL_${TEST NAME}.png
    Close Browser

Fazer login com Sucesso
    Dado que o usuário esteja na tela de Login
    Quando o usuário preencher os campos de usuario e senha   ${USUARIO_VALIDO}    ${SENHA_VALIDO}
    Então deve ser redirecionado para a página inicial
