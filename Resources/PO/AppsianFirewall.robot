*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description
Variables  ../../CustomLibrary/properties.py


*** Keywords ***
Change Ruleset ID
   Go To       ${CS_OR_HR_CALSTATE_URL}
   Input Text   id=userid     ${PEOPLESOFT_USERNAME}
   Input Text   id=pwd        ${PEOPLESOFT_PWD}

   Click Button    xpath=//*[@id="login"]/div/div[1]/div[8]/input

   Wait Until Page Contains Element    xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]
   Click Element    xpath=//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]

   Wait Until Element Is Visible    xpath=//*[@id="fldra_GS_APPSIAN"]
   Click Element    xpath=//*[@id="fldra_GS_APPSIAN"]

   Wait Until Element Is Visible    xpath=//*[@id="fldra_GS_MOBILE"]
   Click Element    xpath=//*[@id="fldra_GS_MOBILE"]

   Wait Until Element Is Visible    xpath=//*[@id="fldra_GS_ERP_FIREWALL"]
   Click Element    xpath=//*[@id="fldra_GS_ERP_FIREWALL"]

   Wait Until Element Is Visible    xpath=//*[@id="crefli_GS_FW_SETUP_GBL"]/a
   Click Element    xpath=//*[@id="crefli_GS_FW_SETUP_GBL"]/a

   Wait Until Page Contains     xpath=//*[@id="GS_FW_SYSTEM_GS_ACTV_RULESET"]
   Clear Element Text   xpath=//*[@id="GS_FW_SYSTEM_GS_ACTV_RULESET"]
   Input Text   xpath=//*[@id="GS_FW_SYSTEM_GS_ACTV_RULESET"]   ${RULSET_ID}

   Click Element    xpath=//*[@id="#ICSave"]



