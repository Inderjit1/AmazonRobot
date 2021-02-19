*** Settings ***
Documentation    Initiate post-clone scripts
Resource    ../Resources/PostCloneApp.robot
Resource    ../Resources/CommonWeb.robot

Test Setup      Begin Connection
Test Teardown   End Connection


*** Variables ***


*** Test Cases ***
Post-Clone Scripts
    [Documentation]    Run Post-Clone scripts for DB Clone
    [Tags]  Scripts
    PostCloneApp.Change SYSADM Password in Database
    PostCloneApp.Run Post Clone Script
    PostCloneApp.Start App Server

Recycle Web Server
    [Documentation]     Recyle the web servers
    [Tags]  WebServer
    PostCloneApp.Recycle Web Server


