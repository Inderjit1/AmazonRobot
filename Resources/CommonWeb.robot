*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser    ${URL}  ${BROWSER}
    maximize browser window

End Web Test
    Close All Browsers