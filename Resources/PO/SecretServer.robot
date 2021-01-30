*** Settings ***
Library     SeleniumLibrary
Documentation    Suite description
Variables  ../../CustomLibrary/properties.py



*** Keywords ***
Log into Secret Server
    [Documentation]     Log into secret server
    Wait Until Page Contains Element    xpath=//*[@id="LoginUserControl1_UserNameTextBox"]
    Input Text      id=LoginUserControl1_UserNameTextBox    ${ID}
#    Input Text      id=LoginUserControl1_PasswordTextBox    ${SECRET_SERVER_PWD}
    Input Text      id=LoginUserControl1_PasswordTextBox    ${TARGET_DB}
    #Click Element   xpath=//*[@id="LoginUserControl1_DomainDropDownList"]
    Wait Until Page Contains Element    xpath=//*[@id="LoginUserControl1_DomainDropDownList"]/option[2]
    Click Element    xpath=//*[@id="LoginUserControl1_DomainDropDownList"]/option[2]
    Click Element    xpath=//*[@id="LoginUserControl1_LoginButton"]
    Wait Until Page Contains Element    xpath=//*[@id="LoginUserControl1_DuoPushButton"]
    Click Element   xpath=//*[@id="LoginUserControl1_DuoPushButton"]

Update Secret Server Password
    [Documentation]      Update password in Secret Server
    Wait Until Element Is Visible   xpath=//*[@id="nav-folder-container"]/ss-folder-tree/ul/li[2]
    Click Element   xpath=//*[@id="nav-folder-container"]/ss-folder-tree/ul/li[2]
    Wait Until Element Is Visible   xpath=//*[@id="folder-235"]
    Click Element   xpath=//*[@id="folder-235"]

#    Wait Until Element Is Visible   xpath=//a[contains(text(), ${SECRET_SERVER_DB})]
    Wait Until Element Is Visible   xpath=//a[contains(text(), ${TARGET_DB})]
    Click Element       xpath=//a[contains(text(),${TARGET_DB})]

    Wait Until Element Is Visible   xpath=//*[@id="edit-secret-password-edit"]
    Click Element   xpath=//*[@id="edit-secret-password-edit"]

    Wait Until Element Is Visible   xpath=//*[@id="edit-form-item-field"]/div/table/tr/td[1]/div[1]/input
    Clear Element Text  xpath=//*[@id="edit-form-item-field"]/div/table/tr/td[1]/div[1]/input
    Input Text  xpath=//*[@id="edit-form-item-field"]/div/table/tr/td[1]/div[1]/input   ${NEW_SYSADM_PWD}

    Click Element   xpath=//*[@id="modal-secret-field-save"]


#//*[@id="secrets"]/tbody/tr[1]/td[2]/span/a
#//*[@id="secrets"]/tbody/tr[2]/td[2]/span
