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
    Click Element                                  ${BTN_PAGAMENTO_CONTAS}
    Esperar elemento visivel                       ${TABELA_PAGAMENTO_CONTAS}       10s

Preencher formulário de pagamento
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Esperar elemento visivel                       ${NOME_PAYEE}                    10s
    Input Text     ${NOME_PAYEE}                   ${nome}
    Input Text     ${CAMPO_ENDERECO}               ${endereco}
    Input Text     ${CAMPO_CIDADE}                 ${cidade}
    Input Text     ${CAMPO_ESTADO}                 ${estado}
    Input Text     ${CAMPO_CEP}                    ${cep}
    Input Text     ${CAMPO_TELEFONE}               ${telefone}
    Input Text     ${CAMPO_CONTA}                  ${conta}
    Input Text     ${CAMPO_VERIFICAR_CONTA}        ${verificar_conta}
    Input Text     ${CAMPO_QUANTIDADE}             ${quantidade}

Quando ele preenche os campos de pagamento
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Preencher formulário de pagamento    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Click Element                                  ${BOTAO_ENVIAR_PAGAMENTO}

E preencher os campos de pagamento e capturar evidência
    [Arguments]    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}    ${evidencia_id}
    Preencher formulário de pagamento    ${nome}    ${endereco}    ${cidade}    ${estado}    ${cep}    ${telefone}    ${conta}    ${verificar_conta}    ${quantidade}
    Capturar Print Na Pasta Da Funcionalidade      ${evidencia_id} step-02     Resources/BillPay/Evidences

Então o pagamento deve ser realizado
    Wait Until Page Contains Element               ${MENSAGEM_RESULTADO}           10s
    Page Should Contain Element                    ${MENSAGEM_RESULTADO}

Então o pagamento NÃO deve ser realizado devido ao campo obrigatório
    [Arguments]    ${locator_erro}
    Esperar elemento visivel                       ${locator_erro}                 10s
    Element Should Be Visible                      ${locator_erro}