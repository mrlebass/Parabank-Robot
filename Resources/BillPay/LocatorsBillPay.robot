*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BTN_PAGAMENTO_CONTAS}              css:a[href="billpay.htm"]
${TABELA_PAGAMENTO_CONTAS}           css:table[class="form2"]
${NOME_PAYEE}                        css:input[name="payee.name"]
${CAMPO_ENDERECO}                    css:input[name="payee.address.street"]
${CAMPO_CIDADE}                      css:input[name="payee.address.city"]
${CAMPO_ESTADO}                      css:input[name="payee.address.state"]
${CAMPO_CEP}                         css:input[name="payee.address.zipCode"]
${CAMPO_TELEFONE}                    css:input[name="payee.phoneNumber"]
${CAMPO_CONTA}                       css:input[name="payee.accountNumber"]
${CAMPO_VERIFICAR_CONTA}             css:input[name="verifyAccount"]
${CAMPO_QUANTIDADE}                  css:input[name="amount"]
${SELECT_CONTA}                      css:select[id="accountId"]
${BOTAO_ENVIAR_PAGAMENTO}            css:input[type="button"][value="Send Payment"]
${MENSAGEM_RESULTADO}                css:div[id="billpayResult"]

# Mensagens de Erro
${MENSAGEM_ERRO}                     css:div[id="billpayError"]
${MENSAGEM_ERRO_NOME}                css:span[id="validationModel-name"]
${MENSAGEM_ERRO_ENDERECO}            css:span[id="validationModel-address"]
${MENSAGEM_ERRO_CIDADE}              css:span[id="validationModel-city"]
${MENSAGEM_ERRO_ESTADO}              css:span[id="validationModel-state"]
${MENSAGEM_ERRO_CEP}                 css:span[id="validationModel-zipCode"]
${MENSAGEM_ERRO_TELEFONE}            css:span[id="validationModel-phoneNumber"]
${MENSAGEM_ERRO_CONTA}               css:span[id="validationModel-account-empty"]
${MENSAGEM_ERRO_VERIFICAR_CONTA}     css:span[id="validationModel-verifyAccount-empty"]
${MENSAGEM_ERRO_QUANTIDADE}          css:span[id="validationModel-amount-empty"]