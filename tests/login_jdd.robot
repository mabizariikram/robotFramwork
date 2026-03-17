*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.resource
Resource   ../pages/login_page.resource
Library    DataDriver    ../data/jdd.csv   dialect=excel   encoding=utf-8
Test Setup   init browser
Test Teardown    Close Browser
Test Template    Data Driven Test 

*** Keywords ***
Data Driven Test
    [Arguments]    ${username}    ${password}    ${result}
    login_page.saisir username   ${username}
    login_page.saisir password   ${password}
    login_page.click login 
    IF    '${result}' == 'success'
        Location Should Be    https://www.saucedemo.com/inventory.html
    ELSE
        ${error_msg}=        login_page.Get error message
        Should Be Equal    ${error_msg}   Epic sadface: Username and password do not match any user in this service
    END



# *** Test Cases ***        username    password    result
# login ucpc    standard_user    secret_sauce   success
# login uipc    standard_user    wrong_pass   fail
# login ucpi   wrong_user    secret_sauce   fail
# login uipci   wrong_user    wrong_pass   fail



*** Test Cases ***
login with data 



