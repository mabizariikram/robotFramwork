***Settings***
Documentation     Login tests for the application
Library           ../bibiloi.py
Resource          ../resources/keywords.resource

# *** Keywords ***
# saluer tout le monde
#     Log To Console  Hello everyone
# saluer
#     [Arguments]  ${name}
#     Log To Console  Hello ${name}
# somme
#     [Arguments]  ${a}  ${b}
#     ${result}=  Evaluate  ${a} + ${b}
#     Log To Console  The sum of ${a} and ${b} is ${result}





***Test Cases***
login test 
  saluer tout le monde
  saluer  John
  somme  5  10
  ${age}  get_age  2000
  Log To Console  The age is ${age}
  