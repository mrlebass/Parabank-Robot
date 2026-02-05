*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MENSAGEM_ERRO2}         css:div[id="showError"]
${BTN_TRANSFERENCIA}      css:a[href="transfer.htm"]
${CAMPO_QUANTIDADE}       css:input[id="amount"]
${OPTION_CONTA_ORIGEM}    css:select[id="fromAccountId"]
${OPTION_CONTA_DESTINO}   css:select[id="toAccountId"]
${BTN_TRANSFERIR}         css:input[type="submit"][value="Transfer"]
${MENSAGEM_SUCESSO}       css:div[id="showResult"]