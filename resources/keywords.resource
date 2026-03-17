*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/login_page.resource

*** Variables ***
${BROWSER}    chrome
${URL}        https://saucedemo.com/


*** Keywords ***
saluer tout le monde
    Log To Console  Hello everyone
saluer
    [Arguments]  ${name}
    Log To Console  Hello ${name}
somme
    [Arguments]  ${a}  ${b}
    ${result}=  Evaluate  ${a} + ${b}
    Log To Console  The sum of ${a} and ${b} is ${result}
init browser

    #Open Browser    https://saucedemo.com/    chrome
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Implicit Wait    5s
    Maximize Browser Window

saisir credentials  
    [Arguments]  ${username}  ${password}
    Input Text    id:user-name    ${username}
    Input Text    css:#password     ${password}
    Click Button    id:login-button

go to sauce demo
    init browser
    login_page.do login  standard_user  secret_sauce


