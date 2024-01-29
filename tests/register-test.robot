*** Settings ***
Documentation       Como cliente da loja virtual, desejo criar um
...                 cadastro no sistema para poder visualizar meus
...                 pedidos e lista de desejos.

Library             SeleniumLibrary
Resource            ../config.resource
Resource            ../page_objects/menu_page_object.resource
Resource            ../page_objects/account_page_object.resource
Resource            ../page_objects/register_page_object.resource

Test Setup          Open Browser    ${URL}
Test Teardown       Close Browser

*** Test Cases ***
Scenario: Success sign in as Natural Person
    Given Click link                 ${MY_ACCOUNT_BUTTON}          
    When Input text                  ${NAME_TEXT_FIELD}            Lorem ipsum
    And Input text                   ${MAIL_TEXT_FIELD}            lorem@ipsum.com
    And Input Password               ${PASS_TEXT_FIELD}            foo123
    And Input Password               ${CONFIRM_PASS_TEXT_FIELD}    foo123
    And Select From List By Label    ${BUSINESS_ENTITY_COMBOBOX}   Pessoa Física
    And Select Checkbox              ${TERMS_OF_USE_CHECKBOX}      
    And Submit Form                  ${REGISTER_BUTTON}
    Then Wait Until Page Contains    Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link     ${MY_WHISH_LIST_LINK}
    And Page Should Contain Link     ${MY_ORDERS_LINK}

Scenario: Success sign in as Juridical Person
    Given Click link                 ${MY_ACCOUNT_BUTTON}          
    When Input text                  ${NAME_TEXT_FIELD}            Lorem ipsum LTDA
    And Input text                   ${MAIL_TEXT_FIELD}            contato@ipsum.com
    And Input Password               ${PASS_TEXT_FIELD}            54321
    And Input Password               ${CONFIRM_PASS_TEXT_FIELD}    54321
    And Select From List By Label    ${BUSINESS_ENTITY_COMBOBOX}   Pessoa Jurídica
    And Select Checkbox              ${TERMS_OF_USE_CHECKBOX}      
    And Submit Form                  ${REGISTER_BUTTON}
    Then Wait Until Page Contains    Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link     ${MY_INVOICES_LINK}
    And Page Should Contain Link     ${MY_ORDERS_LINK}                   
