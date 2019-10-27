*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/HomePage.resource
*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc


*** Keywords ***
## Gerkin language can get this argument
Unauthen user add product "${product id}" to shopping cart
    Homepage.Add product to shopping cart    ${product id}
    
I checkout product
    Given Unauthen user add product "1" to shopping cart
    When Checkout product
        #Then I should see total product price equal to "$16.51"
        #And I should see shipping fee equal to "$2.00"
        #And I should see total price  equal to "$18.51"
        #And I should see total price  equal to summary price