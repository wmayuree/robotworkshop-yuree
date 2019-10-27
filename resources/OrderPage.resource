*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc


*** Keywords ***
Wait until page load success
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    
Veryfy total product price
    [Arguments]    ${expect total products price}
    ${total product prices} =    Get Text    id:total_product
    ${total shipping prices} =    Get Text    id:total_shipping
    ${total prices} =    Get Text    id:total_price
    Should Be Equal As Strings    ${expect total products price}    ${total product prices}    
    Should Be Equal As Strings    $2.00    ${total shipping prices}    
    Should Be Equal As Strings    $18.51    ${total prices}    
    ${total product prices} =    Replace String    ${total product prices}    $    ${EMPTY}
    Should Be Equal As Strings    16.51    ${total product prices}  
  
Summary total price
    #  $12.21
    ${total product} =    Get Text    id:total_product
    ${total product} =    Replace String    ${total product}    $    ${EMPTY}
    ${total product} =    Convert To Number    ${total product}
        
    ${total shipping} =    Get Text    id:total_shipping
    ${total shipping} =    Replace String    ${total shipping}    $    ${EMPTY}
    ${total shipping} =    Convert To Number    ${total shipping}
        
        
    ${total tax} =    Get Text    id:total_tax
    ${total tax} =    Replace String    ${total tax}    $    ${EMPTY}
    ${total tax} =    Convert To Number    ${total tax}

    ${total price} =    Get Text    id:total_price
    ${total price} =    Replace String    ${total price}    $    ${EMPTY}
    ${total price} =    Convert To Number    ${total price}        
    
    ${expected total} =    Evaluate    ${total product}    ${total shipping}    ${total tax}
    Should Be Equal As Numbers    ${expected total}    ${total price}       
    