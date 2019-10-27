*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${target url}    http://automationpractice.com/index.php
${Browser}    gc

*** Test Cases ***
Open browser demo
    Open Browser    url=${target url}    browser=${Browser}
    #Open Browser    https://google.com    browser=gc
    
Test Id locator
    ## it will open broser then click on the id named contact-link in this url then goes to new page
    Open Browser    url=${target url}    browser=${Browser}
    Click Element    id:contact-link    
    Page Should Contain    send a message    
    
    
Test css locator
    ## it will open broser then click on the element name a class name login in this url then goes to new login page , 
    ## after that we should veryfy the latest page contain expected wording
    Open Browser    url=${target url}    browser=${Browser}
    Click Element    css=a.login   
    Sleep    1 seconds
    Page Should Contain    Already registered   
    
Test css locatorabc
    ## it will open broser then click on the element name a class name login in this url then goes to new login page , 
    ## after that we should veryfy the latest page contain expected wording
    Open Browser    url=${target url}    browser=${Browser}
    ${myname}    Set Variable    abc
    Execute Javascript    document.getElementById("search_query_top").value =  "${myname}"