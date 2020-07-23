*** Settings ***
Library  SeleniumLibrary
Variables  ../../CustomLibrary/properties.py

*** Variables ***

${LANDING_NAVIGATION_ELEMENT} =  id=login
#${USER_NAME} =  BLANK
#${PASSWORD} =   BLANK
#${CSU_ID_SERACH} =  010203453

*** Keywords ***

Verify Page Loaded
    Wait Until Page Contains Element    ${LANDING_NAVIGATION_ELEMENT}

Sign In
#    Input Text  id=userid   ${USER_NAME}
#    Input Text   id=pwd   ${PASSWORD}
    Input Text  id=userid   ${properties.USERNAME}
    Input Text   id=pwd   ${properties.PASSWORD}
    Click Button    name=Submit

Check Table Is Correct
     Table Should Contain    id=CSU_ID_DTL$scroll$0     Detail

Navigate To CSU ID Search
    Wait Until Page Contains Element    id=${HR_PAGE_ID}
    Click Link  xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Scroll Element Into View    xpath=//*[@id="crefli_CSU_ID_SEARCH"]/a
    Click Link  xpath=//*[@id="crefli_CSU_ID_SEARCH"]/a
    Wait Until Page Contains    CSU ID Search   #ptifrmtgtframe
    Select Frame    xpath=//iframe
    Input Text      id=CSU_ID_SRCH_WRK_EMPLID       ${properties.ID}
    Click Button    id=HRS_APP_SRCH_PB1
    wait until keyword succeeds  5  2s  Check Table Is Correct




