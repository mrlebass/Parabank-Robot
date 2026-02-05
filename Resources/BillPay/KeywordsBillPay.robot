*** Settings ***
Resource    ../../Settings/main.robot
Resource    LocatorsBillPay.robot

*** Variables ***
${VALOR_NOME_PAYEE}                 John Doe
${VALOR_ENDERECO}                   123 Elm St
${VALOR_CIDADE}                     Springfield
${VALOR_ESTADO}                     IL
${VALOR_CEP}                        62704
${VALOR_TELEFONE}                   555-1234
${VALOR_CONTA}                      13344
${VALOR_VERIFICAR_CONTA}            13344
${VALOR_QUANTIDADE}                 900
${VALOR_SELECT_CONTA}               12900

*** Keywords ***
Dado que o usuário esteja na página de pagamento de contas
    Fazer login com Sucesso
    Click Element                                  ${BTN_PAGAMENTO_CONTAS}
    Wait Until Element Is Visible                  ${TABELA_PAGAMENTO_CONTAS}       10s
    Capturar Print Na Pasta Da Funcionalidade      QBEF-30 step-01                  Resources/BillPay/Evidences

# Mensagens de resultado
Então deve mostrar uma mensagem de sucesso
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_RESULTADO}           10s
    Element Should Be Visible                      ${MENSAGEM_RESULTADO}    
    Capturar Print Na Pasta Da Funcionalidade      QBEF-30 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com o nome vazio
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_NOME}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_NOME}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-31 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com o endereço incompleto
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_ENDERECO}       10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_ENDERECO}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-32 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com a cidade vazia
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_CIDADE}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_CIDADE}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-33 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com o estado vazio
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_ESTADO}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_ESTADO}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-34 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com o cep vazio
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_CEP}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_CEP}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-35 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com o telefone vazio
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_TELEFONE}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_TELEFONE}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-36 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com a quantidade vazia
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_QUANTIDADE}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_QUANTIDADE}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-37 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com a conta vazia
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_CONTA}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_CONTA}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-38 step-03                 Resources/BillPay/Evidences

Então deve mostrar uma mensagem de erro com a verificar conta vazia
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}
    Wait Until Element Is Visible                  ${MENSAGEM_ERRO_VERIFICAR_CONTA}           10s
    Element Should Be Visible                      ${MENSAGEM_ERRO_VERIFICAR_CONTA}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-39 step-03                 Resources/BillPay/Evidences

# Campos obrigatórios: nome, endereço, cidade, estado, cep, telefone, conta, verificar conta, quantidade
E preencher os campos de pagamento com os dados completos
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-30 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de nome vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-31 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de endereço incompleto
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-32 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de cidade vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-33 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de estado vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-34 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de cep vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-35 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de telefone vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-36 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de conta vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-37 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de verificar conta vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-38 step-02     Resources/BillPay/Evidences

E preencher os campos de pagamento com o dado de quantidade vazio
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Wait Until Element Is Visible                  ${NOME_PAYEE}                 10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      QBEF-39 step-02     Resources/BillPay/Evidences