*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TEAM_HEADER_LABEL} =   css=#team > div > div:nth-child(1) > div > h2

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${TEAM_HEADER_LABEL}

Validate Page Contents
    # This fails in Chrome but passes in Edge
    #   Element Text Should Be   ${TEAM_HEADER_LABEL}   Our Amazing Team
    ${ElementText} =    Get Text    ${TEAM_HEADER_LABEL}
    should be equal as strings  ${ElementText}  Our Amazing Team    ignore_case=true
