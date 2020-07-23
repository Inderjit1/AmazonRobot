*** Settings ***
Library  SeleniumLibrary
Variables  ../CustomLibrary/properties.py

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser    ${properties.URL}      ${BROWSER}
    Maximize Browser Window

End Web Test
    Close All Browsers
