*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MENSAGEM_ERRO2}         css:div[id="showError"]
${TRANSFER_FUNDS}         css:a[href="transfer.htm"]
${AMOUNT_FIELD}           css:input[id="amount"]
${FROM_ACCOUNT}           css:select[id="fromAccountId"]
${TO_ACCOUNT}             css:select[id="toAccountId"]
${BTN_TRANSFER}           css:input[type="submit"][value="Transfer"]
${MENSAGEM_SUCESSO}       css:div[id="showResult"]