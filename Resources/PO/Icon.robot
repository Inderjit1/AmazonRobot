*** Settings ***
Documentation    Suite description



*** Keywords ***
Navigate To Tree Manager
    Wait Until Page Contains Element    id=${HR_PAGE_ID}
    Wait Until Element Is Visible   xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Click Link     xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Scroll Element Into View    xpath=//*[@id="fldra_PT_TREE_MANAGER"]
    Wait Until Element Is Visible   xpath=//*[@id="fldra_PT_TREE_MANAGER"]
    Click Link  xpath=//*[@id="fldra_PT_TREE_MANAGER"]
    Wait Until Element Is Visible   xpath=//*[@id="crefli_PT_PSTREEMGR_GBL"]/a
    Click Link  xpath=//*[@id="crefli_PT_PSTREEMGR_GBL"]/a


Verify Icons Exist
    Select Frame    xpath=//*[@id="ptifrmtgtframe"]
    # Wait for Text box to appear
    Wait Until Element Is Visible   xpath=//*[@id="PSTREEDEFVW_TREE_NAME"]
    Input Text  xpath=//*[@id="PSTREEDEFVW_TREE_NAME"]     ACAD_ORGANIZATION
    Click Button    xpath=//*[@id="#ICSearch"]

    Wait Until Element Is Visible   xpath=//*[@id="SEARCH_RESULT1"]
    Click Link  xpath=//*[@id="SEARCH_RESULT1"]

    Wait Until Page Contains    Tree Manager
    Wait Until Element Is Visible    xpath=//*[@id="N1"]/a[1]/img
    Page Should Contain Image   xpath=//*[@id="N1"]/a[1]/img
    Page Should Contain Image   xpath=//*[@id="N1"]/a[2]/img
    Page Should Contain Image   xpath=//*[@id="N1"]/a[3]/img
    Page Should Contain Image   xpath=//*[@id="N1"]/a[4]/img
    Click Element   xpath=//*[@id="N1"]/a[1]/img
