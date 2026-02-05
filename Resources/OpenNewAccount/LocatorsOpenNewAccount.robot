*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LINK_NOVA_CONTA}               //*[@id="leftPanel"]/ul/li[1]/a
${SELECT_TIPO_CONTA}             //*[@id="type"]
${BOTAO_ABRIR_CONTA}             css:input[type="button"][value="Open New Account"]
${MENSAGEM_SUCESSO_CONTA}        //*[@id="openAccountResult"]/h1
${NUMERO_NOVA_CONTA}             //*[@id="newAccountId"]