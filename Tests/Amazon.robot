*** Settings ***
Documentation   This is some basic info about the whole suite
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser    http://www.amazon.com   chrome
    Wait Until Page Contains    Today's Deals
    Input Text  id=twotabsearchtextbox  Speakers
    Click Button    xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains     results for "Speakers"
    Click Link  xpath=//*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div/div/div[2]/div[2]/div/div[1]/div/div/div[1]/h2/a
    Wait Until Page Contains    Back to results
    Click Button    Add to Cart
    Wait Until Page Contains    Added to Cart
    Click Link    id=hlb-ptc-btn-native
    Wait Until Page Contains    Add to your order
    Click Button    xpath=//*[@id="siNoCoverage-announce"]
    Element Text Should Be  xpath=//*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1  Sign In
    Close Browser

*** Keywords ***
