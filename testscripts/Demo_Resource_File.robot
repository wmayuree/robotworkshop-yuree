*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/HomePage.resource
Resource    ../resources/OrderPage.resource
Resource    ../stepdefinition/purchase_product_steps.resource

Suite Setup    Ecommerce Suit Setup
Suite Teardown    Ecommerce Suite Teardown
Test Setup    Ecommerce Test Setup
#Test Teardown    Dialogue.pause Execution

*** Test Cases ***
Test import selenium resource file
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"] 

Demo page resource
   #Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    #Click Link    css:ul#homefeatured a[data-id-product="1"]
    Homepage.Add product to shopping cart    1    
    #Sleep    3 seconds
    Homepage.Checkout product
    OrderPage.Wait until page load success
    OrderPage.Veryfy total product price    $16.51
    OrderPage.Summary total price
    
Demo math
    ${result} =    Evaluate    2 + 10
    Log    ${result}
    
# Test script style , atdd
ATDD Unauthen user checkout single product should calculate total price and shipping
       
        #[Tags]    ignore\
        Given Unauthen user add product "1" to shopping cart
        And Unauthen user add product "2" to shopping cart
        When I checkout product
        #Then I should see total product price equal to "$16.51"
        #And I should see shipping fee equal to "$2.00"
        #And I should see total price  equal to "$18.51"
        #And I should see total price  equal to summary price
    