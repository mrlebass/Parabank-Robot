*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CAMPO_USUARIO}          css:input[name="username"]
${CAMPO_SENHA}            css:input[name="password"]
${BOTAO_LOGIN}            css:input[type='submit'][value="Log In"]
${BTN_LOGOUT}             css:a[href="logout.htm"]
${PAINEL_DIREITA}         id:rightPanel
${PAINEL_ESQUERA}         id:leftPanel
${MSG_ERROR_LOGIN}        css:p[class="error"]
${BTN_OVERVIEW}           css:a[href="overview.htm"]
${TABELA_TRANSFERENCIA}   css:table[id="accountTable"]
${TABLE_ACCOUNT}          css:table#accountTable thead tr th:nth-child(1)
${TABLE_BALANCE}          css:table#accountTable thead tr th:nth-child(2)