*** Settings ***

*** Variables ***
# Defaults (podem ser sobrescritos via CLI: -v BASE_URL:... -v BROWSER:... -v HEADLESS:True)
${BASE_URL_QAA}     http://parabank.parasoft.com/parabank/index.htm
${BASE_URL_PRD}     http://parabank.parasoft.com/parabank/index.htm
${BROWSER}      chrome
${HEADLESS}     False

*** Keywords ***
Dado que eu acesse o site Parabank
    ${options}=    Criar Opcoes Do Browser
    Open Browser   url=${BASE_URL_QAA}    browser=${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    10s

Criar Opcoes Do Browser
    # Cria opções (Chrome) e habilita headless somente quando HEADLESS=True
    ${is_chrome}=    Evaluate    '${BROWSER}'.lower() == 'chrome'
    IF    ${is_chrome}
        ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --no-sandbox
        ${headless}=   Evaluate    str('${HEADLESS}').lower() in ['true','1','yes']
        IF    ${headless}
            Call Method    ${options}    add_argument    --headless=new
        END
        [Return]    ${options}
    END
    # Para outros browsers, retorna None (SeleniumLibrary aceita)
    [Return]    ${None}

Fechar o navegador
    Close Browser
