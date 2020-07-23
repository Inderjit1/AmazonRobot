*** Settings ***
Documentation    Suite description
Resource  ./PO/Landing.robot
Resource  ./PO/MaskedEmails.robot
Resource  ./PO/AddUserRole.robot
Resource  ./PO/Icon.robot
Resource  ./PO/PSQuery.robot
Resource  ./PO/SQR_Report.robot


*** Keywords ***
Go to Landing Page
    Landing.Verify Page Loaded

Sign On
    Landing.Sign In

Navigate To CSU ID Search
    Landing.Navigate To CSU ID Search

Check Masked Emails
   MaskedEmails.Navigate To Modify Person
   MaskedEmails.Validate Masked Email is Set

Add User Role Permission
    AddUserRole.Navigate To User Profiles
    AddUserRole.Click Add Role

Icon Check
    Icon.Navigate To Tree Manager
    Icon.Verify Icons Exist

Run PS Query
    PSQuery.Navigate To Query Page
    PSQuery.Run Query

Run SQR Report
  SQR_Report.Run SQR Report

