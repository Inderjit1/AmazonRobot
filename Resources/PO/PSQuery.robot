*** Settings ***
Documentation    Suite description



*** Keywords ***
Navigate To Query Page
    Wait Until Page Contains Element    id=${HR_PAGE_ID}
    Wait Until Element Is Visible   xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
    Click Link     xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]

    Scroll Element Into View    xpath=//*[@id="fldra_PT_REPORTING_TOOLS"]
    Wait Until Page Contains Element    xpath=//*[@id="fldra_PT_REPORTING_TOOLS"]
    Click Link  xpath=//*[@id="fldra_PT_REPORTING_TOOLS"]

    Wait Until Page Contains Element    xpath=//*[@id="fldra_PT_QUERY"]
    Click Link  xpath=//*[@id="fldra_PT_QUERY"]

    Wait Until Page Contains Element    xpath=//*[@id="crefli_PT_QUERY_MANAGER_GBL"]/a
    Click Link  xpath=//*[@id="crefli_PT_QUERY_MANAGER_GBL"]/a

Run Query
    Select Frame    xpath=//*[@id="ptifrmtgtframe"]
    Wait Until Element Is Visible   xpath=//*[@id="QRYSELECT_WRK_QRYSEARCHTEXT254"]
    Input Text  xpath=//*[@id="QRYSELECT_WRK_QRYSEARCHTEXT254"]     SJ_HR_QUERY_DBLINK_TEST

    Click Button    xpath=//*[@id="QRYSELECT_WRK_QRYSEARCHBTN"]

    Wait Until Element Is Visible   xpath=//*[@id="QRYSELECT_WRK_QRYFIELDCHECKED$0"]
    Click Element   xpath=//*[@id="QRYSELECT_WRK_QRYFIELDCHECKED$0"]

    #Click Element   xpath=//select[@id="QRYSELECT_WRK_QRYACTION"]
    Select From List by Value   xpath=//select[@id="QRYSELECT_WRK_QRYACTION"]   5
    Click Element   xpath=//*[@id="QRYSELECT_WRK_QRYGO"]
    Wait Until Page Contains Element    xpath=//*[@id="QRYDEFNREF2$0"]

    sleep   2s