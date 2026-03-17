*** Settings ***
Resource   ../resources/keywords.resource
Resource   ../pages/product_page.resource

Test Setup       go to sauce demo
Test Teardown    Close Browser
Library    SeleniumLibrary


*** Test Cases ***
scenario 1: add product to cart
    Sleep    2s
    product_page.add product to cart
    ${nb}=   product_page.Get Number of products
    Should Be Equal As Integers   ${nb}   1
 
    Sleep   2s
    # 👉 cliquer sur le panier
    product_page.Aller au panier

    # 👉 vérifier qu’on est sur la bonne page
    Location Should Be    https://www.saucedemo.com/cart.html
    Sleep    2s

    product_page.remove product from cart
    ${badge}=   product_page.Get badge
    Element Should Not Be Visible   ${badge}
