*** Settings ***
Documentation    Actions é o arquivo que terá keywords que inplementam os steps

Library    libs/db.py
Library    SeleniumLibrary
Library    OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/Sidebar.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductPage.robot

*** Keywords ***
### Login
Dado que eu acesso a página de login
    Open Session

Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Login Com    ${email}    ${pass}

Entao devo ser autenticado
    Wait Until Element Is Visible    ${LOGGED_USER}
    Element Text Should Be           ${LOGGED_USER}    Papito

Entao devo ver uma mensagem de alerta "${expect_message}"
    Wait Until Element Contains    class:alert    ${expect_message}

### Produtos
Dado que estou logado
    Login Com    papito@ninjapixel.com    pwd123

Quando eu faço o cadastro desse produto
    [Arguments]    ${json_file}

    ${product_file}=    Get File    resources/fixtures/${json_file}
    ${product_json}=    Evaluate    json.loads($product_file)          json

    Remove Product By Name    ${product_json['name']}
    Create New Product        ${product_json}
    Set Test Variable         ${product_json}

Então devo ver esse item no catálogo
    Sleep                   5
    Table Should Contain    class:table    ${product_json['name']}
