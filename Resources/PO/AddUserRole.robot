*** Settings ***
Documentation    Suite description

*** Variables ***
${HR_PAGE_ID}=  ptpgltlbl_ADMN_SJ_EMPLOYEE_HMPG
${USER_1}=  W0296726
${USER_2}=  W0631879
${USER_3}=  001674037
${USER_ROLE}=   AAAN

*** Keywords ***
Navigate To User Profiles
     Wait Until Page Contains Element    id=${HR_PAGE_ID}
     Wait Until Element Is Visible   xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
     Click Link     xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]

    Scroll Element Into View    xpath=//*[@id="fldra_PT_PEOPLETOOLS"]
    Wait Until Element Is Visible  xpath=//*[@id="fldra_PT_PEOPLETOOLS"]
    Click Link    xpath=//*[@id="fldra_PT_PEOPLETOOLS"]

     Wait Until Element Is Visible  xpath=//*[@id="fldra_PT_SECURITY"]
     Click Link     xpath=//*[@id="fldra_PT_SECURITY"]
     Wait Until Element Is Visible  xpath=//*[@id="fldra_PT_USER_PROFILES"]
     Click Link     xpath=//*[@id="fldra_PT_USER_PROFILES"]
     Wait Until Element Is Visible  xpath=//*[@id="crefli_PT_USERMAINT_GBL"]/a
     Click Link     xpath=//*[@id="crefli_PT_USERMAINT_GBL"]/a

Check Loaded Elements
    Log     Testing keyword succeeds
    Wait Until Element Is Visible    xpath=//*[@id="PSROLEUSER_VW_ROLENAME$9"]
    Input Text  xpath=//*[@id="PSROLEUSER_VW_ROLENAME$9"]   ${USER_ROLE}

Check Table Is Correct
    Table Should Contain    xpath=//*[@id="PSROLEUSER_VW$scrolli$0"]   Academic Advising Adviser Note

Click Add Role
    Select Frame    xpath=//*[@id="ptifrmtgtframe"]
    Wait Until Element Is Visible    xpath=//*[@id="PSOPRDEFN_SRCH_OPRID"]
    Input Text  xpath=//*[@id="PSOPRDEFN_SRCH_OPRID"]   ${USER_1}
    Click Button    xpath=//*[@id="#ICSearch"]
    Wait Until Page Contains Element    xpath=//*[@id="win0divPSPAGECONTAINER"]
    Click Link  xpath=//*[@id="ICTAB_2"]
    Wait Until Page Contains Element    xpath=//*[@id="PSROLEUSER_VW$new$9$$0"]
    Click Link    xpath=//*[@id="PSROLEUSER_VW$new$9$$0"]


    wait until keyword succeeds  5  2s  Check Loaded Elements
    Click Button  xpath=//*[@id="#ICSave"]
    wait until keyword succeeds  5  2s  Check Table Is Correct






