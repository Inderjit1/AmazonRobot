*** Settings ***
Documentation    Suite description
Library     ../../CustomLibrary/polling.py


*** Keywords ***
Run SQR Report
    ${return_status}=   poll_status
    Log     ${return_status}