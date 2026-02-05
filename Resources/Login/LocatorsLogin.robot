*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMPO_USUARIO}          css:input[name="username"]
${CAMPO_SENHA}            css:input[name="password"]
${BOTAO_LOGIN}            css:input[type='submit'][value="Log In"]
${BTN_LOGOUT}             css:a[href="logout.htm"]
${PAINEL_DIREITA}         id:rightPanel
${PAINEL_ESQUERA}         id:leftPanel
${MENSAGEM_ERRO1}         css:p[class="error"]
${BTN_OVERVIEW}           css:a[href="overview.htm"]
${TABELA_TRANSFERENCIA}   css:table[id="accountTable"]