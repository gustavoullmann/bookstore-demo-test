*** Settings ***
Documentation       Como cliente da loja virtual, desejo criar um
...                 cadastro no sistema para poder visualizar meus
...                 pedidos e lista de desejos.

Library             SeleniumLibrary
Test Teardown    Close Browser


*** Test Cases ***
Scenario: Success sign in as Natural Person
    Given Open browser
    And Go To    url=http://localhost:5173/
    And Click link    Minha conta
    When Input text    id: register-name    Lorem ipsum
    And Input text    id: register-mail    loren@ipsum.com
    And Input Password    id: register-pass    foo123
    And Input Password    id: register-confirm-pass    foo123
    And Select From List By Label    id: register-user-type    Pessoa Física
    And Select Checkbox    id: terms-of-use
    And Submit Form    name: register
    Then Wait Until Page Contains    Lorem ipsum, teu cadastro foi realizado com sucesso!
    And Page Should Contain Link    /my-orders
    And Page Should Contain Link    /my-wish-list
