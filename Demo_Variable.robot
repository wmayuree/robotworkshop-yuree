*** Test Cases ***
Demo Scalar
    ${username}    Set Variable    อาร์ท
    ${password}    Set Variable    Welcome1
    Log    Hello ${username} and ${password}
    
Demo List
    @{product_names}    Create List    Iphone 11    Android 12    Window phone
    Log Many    @{product_names}
    Log    ${product_names[1]}    
    
Demo Dictionary
    [Tags]    Smoketest
    [Documentation]    abc can explain in many lines
    ...    
    &{user1}    Create Dictionary    username=john1    password=welcome1
    &{user2}    Create Dictionary    username=jane2    password=welcome2
    Log    ${user1.username}    
    Log    ${user2.password} 
# the comment per one line

Demo Set Keyword
    ${hi} =    Set Variable    Hello, world!   
    ${hi2} =    Set Variable    I said:    ${hi}   
    ${hi}    ${hi2}=    Set Variable    Hello    Hello2    
    #@{list} =    Set Variable    ${list with some items}   
    #${item1} ${item2} =    Set Variable    ${list with 2 items} 

    
