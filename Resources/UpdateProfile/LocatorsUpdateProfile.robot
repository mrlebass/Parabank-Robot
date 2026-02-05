*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LINK_PERFIL}                   //*[@id="leftPanel"]/ul/li[6]/a
${INPUT_FIRSTNAME}               //*[@id="customer.firstName"]
${INPUT_LASTNAME}                //*[@id="customer.lastName"]
${INPUT_STREET}                  //*[@id="customer.address.street"]
${INPUT_CITY}                    //*[@id="customer.address.city"]
${INPUT_STATE}                   //*[@id="customer.address.state"]
${INPUT_ZIP}                     //*[@id="customer.address.zipCode"]
${INPUT_PHONE}                   //*[@id="customer.phoneNumber"]
${BOTAO_SALVAR}                  //*[@id="updateProfileForm"]/form/table/tbody/tr[8]/td[2]/input
${ERRO_LASTNAME}                 //*[@id="lastName-error"]
${ERRO_FIRSTNAME}                //*[@id="firstName-error"]
${ERRO_CITY}                     //*[@id="city-error"]
${ERRO_STATE}                    //*[@id="state-error"]
${ERRO_ZIP}                      //*[@id="zipCode-error"]
${ERRO_PHONE}                    //*[@id="phone-error"]
${ERRO_STREET}                   //*[@id="street-error"]
${CONFIRMAÇÃO_ATUALIZAÇÃO}       Xpath=//*[@id="updateProfileResult"]/h1
