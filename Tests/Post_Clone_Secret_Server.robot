*** Settings ***
Documentation    Initiate post-clone scripts
Resource    ../Resources/PostCloneApp.robot
Resource    ../Resources/CommonWeb.robot

Test Setup  Begin Secret Server Web Test
#Test Teardown   End Secret Server Web Test


*** Variables ***
${BROWSER} =    chrome


*** Test Cases ***
Post-Clone Scripts
    [Documentation]    Update Thycotic Secret Server Password
    [Tags]  Secret
    PostCloneApp.Update password in Secret Server
