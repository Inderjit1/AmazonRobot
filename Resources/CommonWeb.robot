*** Settings ***
Documentation    Suite description

Library     SeleniumLibrary
Library     OperatingSystem
Library     SSHLibrary

Variables   ../CustomLibrary/properties.py


*** Keywords ***
Begin Web Test
#    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome_options}    add_argument    --disable-extensions
##    Call Method    ${chrome_options}    add_argument    --headless
##    Call Method    ${chrome_options}    add_argument    --disable-gpu
##    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Create Webdriver    Chrome    chrome_options=${chrome_options}
#    Go To        ${DELPHIXURL}
#    ${log_file}=     Get Environment Variable
#    Log     ${log_file}

    #Create Webdriver    Chrome      executable_path='C:/Chrome_Versions/Chrome80/chromedriver.exe'
    Open Browser    ${DELPHIXURL}      ${BROWSER}
    Maximize Browser Window


End Web Test
     Close Browser

Begin Appsian Web Test
#    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome_options}    add_argument    --disable-extensions
##    Call Method    ${chrome_options}    add_argument    --headless
##    Call Method    ${chrome_options}    add_argument    --disable-gpu
##    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Create Webdriver    Chrome    chrome_options=${chrome_options}
#    Go To        ${DELPHIXURL}
#    ${log_file}=     Get Environment Variable
#    Log     ${log_file}

    #Create Webdriver    Chrome      executable_path='C:/Chrome_Versions/Chrome80/chromedriver.exe'
    Open Browser    ${CS_OR_HR_CALSTATE_URL}      ${BROWSER}
    Maximize Browser Window


End Appsian Web Test
     Close Browser

Begin Secret Server Web Test
    #    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome_options}    add_argument    --disable-extensions
##    Call Method    ${chrome_options}    add_argument    --headless
##    Call Method    ${chrome_options}    add_argument    --disable-gpu
##    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Create Webdriver    Chrome    chrome_options=${chrome_options}
#    Go To        ${TSSURL}
#    ${log_file}=     Get Environment Variable
#    Log     ${log_file}

    #Create Webdriver    Chrome      executable_path='C:/Chrome_Versions/Chrome80/chromedriver.exe'
    Open Browser    ${TSSURL}      ${BROWSER}
    Maximize Browser Window

End Secret Server Web Test
    Close Browser

Begin Connection
    Open Connection      ${APP_DB}
    Login       ${USERNAME}     ${PASSWORD}

End Connection
    Close Connection
