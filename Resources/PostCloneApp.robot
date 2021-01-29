*** Settings ***
Documentation    Suite description
Resource    ./PO/Delphix.robot
Resource    ./PO/UniWeb.robot
Resource    ./PO/AppsianFirewall.robot
Resource    ./PO/Script.robot
Resource    ./PO/SecretServer.robot
Variables   ../CustomLibrary/properties.py


*** Keywords ***
Log On To Site
    Delphix.Log On To Site

Clone Database
    Delphix.Select Database to Clone

Verify Clone ran succesfully
    Delphix.Verify Clone run

Log On To UniWeb
    UniWeb.Log On To UniWeb

Move Files
    UniWeb.Move Files

Change Ruleset ID
    AppsianFirewall.Change Ruleset ID

Change SYSADM Password in Database
    Script.Change SYSADM Password

Run Post Clone Script
    Script.Run Post Clone Script

Start App Server
    Script.Start App Server

Update password in Secret Server
    SecretServer.Log into Secret Server
    SecretServer.Update Secret Server Password



