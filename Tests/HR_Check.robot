*** Settings ***
Documentation   Check HR Environment after Post-Clone runs

Resource  ../Resources/HRApp.robot
Resource  ../Resources/CommonWeb.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results Tests/Front_Office.robot


*** Variables ***
${BROWSER} =  chrome
${HR_PAGE_ID}=  ptpgltlbl_ADMN_SJ_EMPLOYEE_HMPG

*** Test Cases ***
CSUID Search
    [Documentation]  Access CMS Site
    [Tags]  CMS
    HRApp.Go to Landing Page
    HRApp.Sign On
    HRApp.Navigate To CSU ID Search

Masked Emails
    [Documentation]  Check Masked Emails
    [Tags]  Emails
    HRApp.Go to Landing Page
    HRApp.Sign On
    HRApp.Check Masked Emails

Add User Role
     [Documentation]  Add User Role to account
    [Tags]  Role
    HRApp.Go to Landing Page
    HRApp.Sign On
    HRApp.Add User Role Permission


Icon Check - Make sure icons are over
    [Documentation]  Make sure icons appear
    [Tags]  Icons
    HRApp.Go to Landing Page
    HRApp.Sign On
    HRApp.Icon Check

Run a PS query
    [Documentation]  Run a PeopleSoft Query
    [Tags]  PSQuery
    HRApp.Go to Landing Page
    HRApp.Sign On
    HRApp.Run PS Query

Run SQR Report
    [Documentation]  Runs a SQR Report
    [Tags]  SQR
    HRApp.Run SQR Report