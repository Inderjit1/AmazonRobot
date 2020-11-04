*** Settings ***
Documentation    Suite description
Resource    ./PO/Delphix.robot
Resource    ./PO/UniWeb.robot
Resource    ./PO/Script.robot
Variables   ../CustomLibrary/properties.py


*** Keywords ***
Log On To Site
    Delphix.Log On To Site

Clone Database
    Delphix.Select Database to Clone

Log On To UniWeb
    UniWeb.Log On To UniWeb

Move Files
    UniWeb.Move Files

Start Post-Clone Scripts
    Script.Start script

Start App Server
    Script.Start App Server



