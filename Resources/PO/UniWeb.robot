*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description
Variables  ../../CustomLibrary/properties.py


*** Keywords ***
Log On To UniWeb
    # Go to login page and enter credentials
    Go To   ${UNIWEBURL}
    Wait Until Page Contains Element    xpath=//*[@id="username"]
    Input Text  id=username     ${USERNAME}
    Input Text  id=password     ${PASSWORD}
    Click Button    xpath=//*[@id="login-form"]/div[4]/button

Move Files
    #Navigate to Clone section
    Wait Until Page Contains Element    xpath=//*[@id="navbarResponsive"]/ul/li[3]/a
    Click Element   xpath=//*[@id="navbarResponsive"]/ul/li[3]/a

    # Select San Jose as Campus
    Wait Until Page Contains Element    xpath=//*[@id="source"]
    Click Element       xpath=//*[@id="source"]
    Wait Until Page Contains Element    xpath=//*[@id="source"]/option[2]
    Click Element   xpath=//*[@id="source"]/option[2]

    # Select CS or HR
    # Wait Until Page Contains Element    xpath=//*[@id="test-l-1"]/div[2]/div[1]/div/span/input
    # Click Element   xpath=//*[@id="test-l-1"]/div[2]/div[1]/div/span/input
    Wait Until Page Contains Element     ${CS_OR_HR_SELECT}
    Click Element   ${CS_OR_HR_SELECT}


    #Select Source Database
    Wait Until Page Contains Element    xpath=//*[@id="sourcedb"]
    Wait Until Page Contains Element    xpath=//*[@value="${TARGET_DB}"]
    Click Element   xpath=//*[@value="${TARGET_DB}"]

    # Select Target Database
    Wait Until Page Contains Element    xpath=//*[@id="targetdb"]
    Wait Until Page Contains Element    xpath=//*[@value="${SOURCE_DB}"]
    Click Element   xpath=//*[@value="${SOURCE_DB}"]

    Click Element   xpath=//*[@id="nxt"]
