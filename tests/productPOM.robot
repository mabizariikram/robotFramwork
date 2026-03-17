*** Settings ***
Resource   ../resources/keywords.resource
Resource   ../pages/product_page.resource

Test Setup       go to sauce demo
Test Teardown    Close Browser
Library    SeleniumLibrary


*** Test Cases ***
scenario 1: add product to cart
    product_page.add product to cart
    ${nb}=   product_page.Get Number of products
    Should Be Equal As Integers   ${nb}   1
    product_page.remove product from cart
    ${badge}=   product_page.Get badge
    Element Should Not Be Visible   ${badge}
