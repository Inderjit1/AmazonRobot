*** Settings ***
Library     SeleniumLibrary
Library     Process
Library     ../../CustomLibrary/SQLPlus.py
Documentation    Suite description



*** Keywords ***
Start script
    [Documentation]     Starting script execution
       #SSHLibrary.List Files in Directory

       # Logs into App Server and stops it
       ${stdout}=   Execute Command      ${APPSERVER_STOP_SCRIPT}
       Log  ${stdout}

       # Log in and change SYSADM Password
       Open Connection     ${DEV_DB}
       Login    ${USERNAME}     ${PASSWORD}
       Execute Command      ${CHANGE_PASSWORD_SCRIPT}
       Execute Command      ${NEW_SYSADM_PWD}

       # Log into SQLPlus
       sqlplus_connect


Start App Server
    [Documentation]     Start App Server and clear cache
    Execute Command     ${APPSERVER_START_SCRIPT}
