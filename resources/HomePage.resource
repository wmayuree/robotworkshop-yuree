*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc


*** Keywords ***
Add product to shopping cart
    [Arguments]    ${product id}     #explain this keyword using any input?
    Mouse Over    xpath:(//div[@class="product-image-container"])[${product id}]
    Click Link    css:ul#homefeatured a[data-id-product="${product id}"]
    
Checkout product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
Ecommerce Suit Setup
    Open Browser    http://automationpractice.com/index.php    browser=gc
    Maximize Browser Window
    
Ecommerce Test Setup
    Delete All Cookies
    Go To    ${target url}
    
Ecommerce Suite Teardown    
    Close All Browsers 