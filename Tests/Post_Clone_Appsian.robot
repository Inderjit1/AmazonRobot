*** Settings ***
Documentation    Initiate post-clone activites

Resource    ../Resources/PostCloneApp.robot
Resource    ../Resources/CommonWeb.robot

Test Setup  Begin Appsian Web Test
Test Teardown   End Appsian Web Test

Variables   ../CustomLibrary/properties.py


*** Variables ***
${BROWSER} =    chrome


*** Test Cases ***
Change Ruleset ID for Web Server
    [Documentation]    Ruleset ID needs to be changed before web server are restarted
    [Tags]  Ruleset
    PostCloneApp.Change Ruleset ID



