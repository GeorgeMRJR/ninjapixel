*** Settings ***
Documentation       Este arquivo implementa a abertura e fechamento do navegador

*** Keywords ***
Open
    Open Browser    http://pixel-web:3000/login    chrome

    Set Selenium Implicit Wait  5

Close
    Close Browser