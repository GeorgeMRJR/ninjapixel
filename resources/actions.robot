*** Settings ***
Documentation    Actions é o arquivo que terá keywords que inplementam os steps

Library    SeleniumLibrary

Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot

*** Keywords ***

Dado que eu acesso a página de login
    Open

Quando eu submeto minhas credenciais "${email}" e "${pass}"
   Login Com  ${email}  ${pass}

Entao devo ser autenticado
    Wait Until Page Contains    Papito

Entao devo ver uma mensagem de alerta "${expect_message}"
    Wait Until Element Contains    class:alert    ${expect_message}