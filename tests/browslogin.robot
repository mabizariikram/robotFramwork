*** Settings ***
Documentation     fonctionnalite d'authentification
Library           SeleniumLibrary
Resource          ../resources/keywords.resource
Test Setup       init browser
Test Teardown    Close browser

*** Test Cases ***
login valide
    [Documentation]    test de login avec des credentials valides
    [Tags]    valid     e2e
 
    #Open Browser    https://saucedemo.com/    chrome
    #gerer le temps de chargement de la page
    Set Selenium Implicit Wait    5s
    Input Text    id:user-name    standard_user
    Input Text    css:#password     secret_sauce
    Click Button    id:login-button
    #Page Should Contain    Swag Labs

   
    ${url }=    Get Location
    Should Not Be Equal As Strings    ${url}    https://www.saucedemo.com/inventory
    #femer le navigateur
    Close Browser



login invalide
    [Documentation]    test de login avec des credentials invalides
    [Tags]    regression    smoke 
 
    #Open Browser    https://saucedemo.com/    chrome
    Input Text    id:user-name    wrong_user
    Input Text    css:#password     wrong_password
    Click Button    id:login-button


    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser







  
    