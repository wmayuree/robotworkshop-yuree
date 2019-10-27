*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc


*** Keywords ***
Ecommerce Suit Setup
    Open Browser    http://automationpractice.com/index.php    browser=gc
    Maximize Browser Window
    
Ecommerce Test Setup
    Delete All Cookies
    Go To    ${target url}
    
Ecommerce Suite Teardown    
    Close All Browsers 