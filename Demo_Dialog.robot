*** Settings ***
Library    Dialogs

*** Test Cases ***
Demo pause dialog
    Log    Step 1
    Dialogs.Pause Execution    Test Pause
    Log    Step 2    


