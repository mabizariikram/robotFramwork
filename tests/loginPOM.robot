*** Settings ***
Resource          ../pages/login_page.resource
Resource          ../resources/keywords.resource
Test Setup       init browser
Test Teardown    Close Browser
                                                                       
*** Test Cases ***
Login with valid credentials
    init browser


    #first option
    # saisir username  standard_user
    # saisir password  secret_sauce
    # click login



    #second option
    do login  standard_user  secret_sauce

    
    # Add assertions to verify successful login
    #Location Should Be  https://www.saucedemo.com/inventory.html
    #Location Should Contain  inventory


       