*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/Common.resource
Suite Setup    Ecommerce Suit Setup
Suite Teardown    Ecommerce Suite Teardown
Test Setup    Ecommerce Test Setup
Test Teardown    Capture Page Screenshot 

*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc

*** Test Cases ***
Open browser demo
    Open Browser    url=${target url}    browser=${Browser}
    #Open Browser    https://google.com    browser=gc
    
  
Normal User checkout single product should calculate total price and shipping fee correctly
    ## it will open broser then click on the element name a class name login in this url then goes to new login page , 
    ## after that we should veryfy the latest page contain expected wording
    #Open Browser    url=${target url}    browser=${Browser}

    #Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"]
    #Sleep    3 seconds
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    ${total product prices} =    Get Text    id:total_product
     ${total shipping prices} =    Get Text    id:total_shipping
      ${total prices} =    Get Text    id:total_price
    Should Be Equal As Strings    $16.51    ${total product prices}    
    Should Be Equal As Strings    $2.00    ${total shipping prices}    
    Should Be Equal As Strings    $18.51    ${total prices}    
    ${total product prices} =    Replace String    ${total product prices}    $    ${EMPTY}
    Should Be Equal As Strings    16.51    ${total product prices} 
    #Close All Browsers   
    #Sleep    1 seconds
    #Page Should Contain    Already registered  
    

Test the setup and tear down if working
    ## it will open broser then click on the element name a class name login in this url then goes to new login page , 
    ## after that we should veryfy the latest page contain expected wording
    #Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link    css:ul#homefeatured a[data-id-product="1"] 
    Log    waiting for implement
    
