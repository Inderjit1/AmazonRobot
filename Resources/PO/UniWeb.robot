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
    Wait Until Element Is Visible   xpath=//*[@id="sourcedb"]
    Wait Until Element Is Visible     xpath=//select[@id="sourcedb"]/option[@value="${SOURCE_DB}"]
    Click Element    xpath=//select[@id="sourcedb"]/option[@value="${SOURCE_DB}"]

    # Select Target Database
    Wait Until Element Is Visible     xpath=//*[@id="targetdb"]
    Wait Until Element Is Visible   xpath=//select[@id="targetdb"]/option[@value="${TARGET_DB}"]
    Click Element   xpath=//select[@id="targetdb"]/option[@value="${TARGET_DB}"]



    Click Element   xpath=//*[@id="nxt"]

    Wait Until Page Contains Element   xpath=//*[@id="myModal"]/div/div/div[2]/p
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div/div[3]/button[1]
    Click Button    xpath=/html/body/div[1]/div/div/div[3]/button[1]

    Go To     https://uniweb20.calstate.edu/listjobs

    Wait Until Keyword Succeeds     10min   30s     Verify Fileshare Completion

Verify Fileshare Completion
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-layout/div/app-job-builder-routing/div/app-listjobs/div/div[3]/button
    Click Element   xpath=/html/body/app-root/app-layout/div/app-job-builder-routing/div/app-listjobs/div/div[3]/button
    Wait Until Element Is Visible   xpath=/html/body/app-root/app-layout/div/app-job-builder-routing/div/app-listjobs/div/div[4]/table/tbody/tr[1]/td[11]   10s
    ${fileshare_check}=     Get Value   xpath=/html/body/app-root/app-layout/div/app-job-builder-routing/div/app-listjobs/div/div[4]/table/tbody/tr[1]/td[11]
    Should Be Equal As Strings  ${fileshare_check}  The file transfer completed
#    Page Should Not Contain

#    Wait Until Element Is Visible   xpath=//*[@id="navbarResponsive1"]/ul/li[2]/a
#    Click Element   xpath=//*[@id="navbarResponsive1"]/ul/li[2]/a
