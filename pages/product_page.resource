*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${add_product_btn}   id:add-to-cart-sauce-labs-backpack
${remove_icon}   id :remove-sauce-labs-backpack
${badge_cart}   css:[data-test='shopping-cart-badge']
${shooping_cart}   css:[data-test='shopping-cart-link']

*** Keywords ***
add product to cart
    Click Button    ${add_product_btn}
remove product from cart
    Click Button    ${remove_icon}
Get Number of products 
    ${nb }=   Get Text    ${badge_cart}
    RETURN  ${nb}
   
   
Aller au panier
    Click Link    ${shooping_cart}

Get badge
   RETURN  ${badge_cart}

    

