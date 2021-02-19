*** Settings ***
Documentation    Initiate post-clone activites

Resource    ../Resources/PostCloneApp.robot
Resource    ../Resources/CommonWeb.robot

Test Setup  Begin Web Test
Test Teardown   End Web Test

Variables   ../CustomLibrary/properties.py


*** Variables ***
${BROWSER} =    chrome


*** Test Cases ***
Delphix
    [Documentation]     Clone database in Delphix
    [Tags]    Delphix
    PostCloneApp.Log On To Site
    PostCloneApp.Clone Database
    PostCloneApp.Verify Clone ran succesfully

UniWeb File Move
    [Documentation]    Move files over through UniWeb
    [Tags]  UniWeb
    PostCloneApp.Log On To Uniweb
    PostCloneApp.Move Files




