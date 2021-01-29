*** Settings ***
Library     SeleniumLibrary
Library     Process
Library     ../../CustomLibrary/SQLPlus.py
Documentation    Suite description



*** Keywords ***
Change SYSADM Password
    [Documentation]     Change SYSADM Password in DEV DB.
       #SSHLibrary.List Files in Directory
       # Logs into App Server and stops it
       ${stdout}=   Execute Command      ${APPSERVER_STOP_SCRIPT}
       Log  ${stdout}

       # Log in and change SYSADM Password
       Open Connection     ${DEV_DB}
       Login    ${USERNAME}     ${PASSWORD}
       Execute Command      ${CHANGE_PASSWORD_SCRIPT}



Run Post Clone Script
    [Documentation]     Run the Post Clone script
       # Run post clone via SQLPlus
       sqlplus_connect

Start App Server
    [Documentation]     Start App Server and clear cache
    Open Connection     ${APP_DB}
    Login    ${USERNAME}     ${PASSWORD}
    Execute Command     ${APPSERVER_START_SCRIPT}
