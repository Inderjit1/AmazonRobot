*** Settings ***
Library  SeleniumLibrary
Variables  ../../CustomLibrary/properties.py

*** Variables ***
${HR_PAGE_ID}=  ptpgltlbl_ADMN_SJ_EMPLOYEE_HMPG

*** Keywords ***
Navigate To Modify Person
    Wait Until Page Contains Element    id=${HR_PAGE_ID}
    Wait Until Element Is Visible   xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Click Link  xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Wait Until Element Is Visible   xpath=//*[@id="fldra_HC_WORKFORCE_ADMINISTRATION"]
    Click Link  xpath=//*[@id="fldra_HC_WORKFORCE_ADMINISTRATION"]
    Wait Until Element Is Visible   xpath=//*[@id="fldra_CO_PERSONAL_INFORMATION"]
    Click Link  xpath=//*[@id="fldra_CO_PERSONAL_INFORMATION"]
    Wait Until Element Is Visible   xpath=//*[@id="fldra_HC_PERSON_BIO"]
    Click Link  xpath=//*[@id="fldra_HC_PERSON_BIO"]
    Wait Until Element Is Visible   xpath=//*[@id="crefli_HC_PERSONAL_DATA2"]/a
    Click Link  xpath=//*[@id="crefli_HC_PERSONAL_DATA2"]/a

Validate Masked Email is Set
  #  Wait Until Page Contains    Personal Data
    Select Frame    xpath=//*[@id="ptifrmtgtframe"]
    Wait Until Page Contains    Personal Data
    Input Text  xpath=//*[@id="PERALL_SEC_SRCH_EMPLID"]    ${properties.ID}
    Click Button    xpath=//*[@id="#ICSearch"]
    Wait Until Page Contains Element    xpath=//*[@id="win0divNAMES_COUNTRY_NM_FORMAT$0"]
    Click Link  xpath=//*[@id="ICTAB_1"]
    Wait Until Element Is Visible   xpath=//*[@id="EMAIL_ADDRESSES_EMAIL_ADDR$0"]
    ${get_email_response}   Get Value    xpath=//*[@id="EMAIL_ADDRESSES_EMAIL_ADDR$0"]
    Should Be Equal As Strings  ${get_email_response}   sjsu.hrtest@gmail.com

