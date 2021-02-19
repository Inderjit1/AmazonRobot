*** Settings ***
Library     SeleniumLibrary
Library     Process
Library     ../../CustomLibrary/SQLPlus.py

Documentation    Suite description



*** Keywords ***
Change SYSADM Password
    [Documentation]     Change SYSADM Password in DEV DB

#     Log To Console   Command to Stop is: ${APPSERVER_STOP_SCRIPT}
#     # Logs into App Server and stops it
#     ${app_db_stop_output}=   Execute Command      ${APPSERVER_STOP_SCRIPT}
#
#     Log to Console  Testing app stop: ${app_db_stop_output}
#     Should Not Be Empty    ${app_db_stop_output}


     # Log in and change SYSADM Password
     Open Connection     ${DEV_DB}
     Login    ${USERNAME}     ${PASSWORD}
     ${pwd}=    Execute Command      pwd

     Log To Console     Present working directory is: ${pwd}
     Log To Console     Change Password command is: ${CHANGE_PASSWORD_SCRIPT}

     ${change_pwd_output}=    Execute Command      ${CHANGE_PASSWORD_SCRIPT}

     Log to Console    Change Password output: ${change_pwd_output}
     Should Not Be Empty    ${change_pwd_output}


Run Post Clone Script
    [Documentation]     Run the Post Clone script
    # Run post clone via SQLPlus
    sqlplus_connect

Start App Server
    [Documentation]     Start App Server and clear cache
    Open Connection     ${APP_DB}
    Login    ${USERNAME}     ${PASSWORD}
    ${appserver_start_output}=      Execute Command     ${APPSERVER_START_SCRIPT}

    Log     ${appserver_start_output}
    Log to Console    ${appserver_start_output}
    Should Not Be Empty     ${appserver_start_output}

Recycle Web Server
     [Documentation]     Recycle Web Server
     Open Connection     ${APP_DB}
     Login    ${USERNAME}     ${PASSWORD}
     ${webserver_output}=    Execute Command     ${WEBSERVER_RECYCLE_SCRIPT}

     Log     ${webserver_output}
     Log to Console   ${webserver_output}
     Should Not Be Empty    ${webserver_output}