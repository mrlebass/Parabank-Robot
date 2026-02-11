*** Variables ***

# Defaults (podem ser sobrescritos via CLI: -v BASE_URL:... -v BROWSER:... -v HEADLESS:True)
${BASE_URL_QAA}     http://parabank.parasoft.com/parabank/index.htm
${BASE_URL_PRD}     http://parabank.parasoft.com/parabank/index.htm
${BROWSER}      chrome
${HEADLESS}     False

*** Keywords ***
Dado que eu acesse o site Parabank
    ${options}=    Criar Opcoes Do Browser
    Open Browser   ${BASE_URL_QAA}    ${BROWSER}    options=${options}
    IF    '${HEADLESS}' != 'True'
        Maximize Browser Window
    END
    Set Selenium Timeout    10s


Criar Opcoes Do Browser
    ${is_chrome}=    Evaluate    '${BROWSER}'.lower() == 'chrome'
    IF    ${is_chrome}
        ${options}=    Evaluate
        ...    sys.modules['selenium.webdriver'].ChromeOptions()
        ...    sys

        ${arg_window}=    Set Variable    --window-size=1920,1080
        ${arg_dev_shm}=   Set Variable    --disable-dev-shm-usage
        ${arg_sandbox}=   Set Variable    --no-sandbox

        Call Method    ${options}    add_argument    ${arg_window}
        Call Method    ${options}    add_argument    ${arg_dev_shm}
        Call Method    ${options}    add_argument    ${arg_sandbox}

        ${headless}=   Evaluate    str('${HEADLESS}').lower() in ['true','1','yes']
        IF    ${headless}
            ${arg_headless}=    Set Variable    --headless=new
            Call Method    ${options}    add_argument    ${arg_headless}
        END

        RETURN    ${options}
    END
    RETURN    ${None}

Fechar o navegador
    Close Browser