*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${username}   id:user-name
${password}   css:#password
${login_btn}  id:login-button
${error_msg}   css:h3[data-test="error"]

*** Keywords ***
saisir username 
    [Arguments]   ${u}
    Input Text    ${username}    ${u}
saisir password
    [Arguments]   ${p}
    Input Text    ${password}    ${p}
click login
    Click Button    ${login_btn}
get error message
    ${msg}=    Get Text    ${error_msg}
    [Return]   ${msg}
do login
    [Arguments]   ${u}  ${p}
    saisir username  ${u}
    saisir password  ${p}
    click login
