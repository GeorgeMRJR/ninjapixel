*** Settings ***
Documentation    Cadastro de produtos
...              Sendo um administrador de catálogo
...              Quero cadastrar produtos
...              Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Test Setup       BasePage.Open
Test Teardown    BasePage.Close

*** Variables ***
&{m}    nome=Mario    cat=Super Nintendo    valor=50    desc=muito bom

*** Test Cases ***
Disponibilizar produto
    Dado que estou logado
    Quando eu faço o cadastro desse produto    ${m}
    Devo ver esse item no catálogo

*** Keywords ***
Dado que estou logado
    Login Com    papito@ninjapixel.com    pwd123

Quando eu faço o cadastro desse produto
    [Arguments]          ${produto}
    Set Test Variable    ${produto}
    Click Element        class:product-add
    Input Text           css:input[name=title]    ${produto['nome']}

    Click Element    css:input[placeholder=Gategoria]
    Click Element    xpath://li/span[text()='${produto['cat']}']
    Click Element    xpath://li/span[text()='${produto['cat']}']

    Input Text       css:input[name=price]             ${produto['valor']}
    Input Text       css:textarea[name=description]    ${produto['desc']}
    Click Element    css:#create-product
    Sleep            5

Devo ver esse item no catálogo
    Click Element    xpath://td[text()='${produto['nome']}']
