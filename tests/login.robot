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
    # gerer le temps de chargement de la page
    #Set Selenium Implicit Wait    5s
    # Input Text    id:user-name    standard_user
    # Input Text    css:#password     secret_sauce
    # Click Button    id:login-button
    #Page Should Contain    inventory
    saisir credentials  standard_user    secret_sauce
    ${url }=    Get Location
    Should Not Be Equal As Strings    ${url}    https://www.saucedemo.com/inventory
    #femer le navigateur
    #Close Browser

login invalide
 
    [Documentation]    test de login avec des credentials invalides
    [Tags]    regression    smoke 
 
    #Open Browser    https://saucedemo.com/    chrome
    # Input Text    id:user-name    wrong_user
    # Input Text    css:#password     wrong_password
    # Click Button    id:login-button
    saisir credentials  wrong_user    wrong_password
    # ya diff  maniere  de verifier le message d'erreur

    #Page Should Contain    Epic sadface: Username and password do not match any user in this service
    #Element Should Be Visible    css:.error-message-container.error
    #Element Should Be Visible    css:h3[data-test="error"]
    ${error_msg}=    Get Text    css:h3[data-test="error"]
    Should Contain    ${error_msg}    Epic sadface: Username and password

    #[Teardown]    Close Browser





  
    