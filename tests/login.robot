*** Settings ***
Documentation    Login
...              Sendo um administrador de catálogo
...              Quero me autenticar no sistema
...              Para que eu possa gerenciar o catálogo de produtos

Resource    ../resources/actions.robot

Test Setup       BasePage.Open
Test Teardown    BasePage.Close


# Lego (peças e vc usa a criativade para montar o que vc quiser)

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
    Entao devo ser autenticado

Senha incorreta
    [Template]               Tentativa de login
    papito@ninjapixel.com    abc123                Usuário e/ou senha inválidos
Email não existe
    [Template]            Tentativa de login
    xxx@ninjapixel.com    abc123                Usuário e/ou senha inválidos

Email Obrigatorio
    [Template]    Tentativa de login
    ${EMPTY}      abc123                Opps. Informe o seu email!

Senha Obrigatoria
    [Template]               Tentativa de login
    papito@ninjapixel.com    ${EMPTY}              Opps. Informe a sua senha!

*** Keywords ***
Tentativa de login
    [Arguments]    ${email}    ${pass}    ${saida}

    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Entao devo ver uma mensagem de alerta "${saida}"


