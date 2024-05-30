*** Settings ***
Documentation   Verify the Membership feature 
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Qualification.xlsx    sheet_name=Sheet2
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/Qualifications.robot
Resource    ../Resources/Membership.robot
Test Template   Add a new membership

*** Test Cases ***
Add the new membership   
    [Tags]    Retest
    [Documentation]    Add a new membership for the users with Mandatory fields only
    ${amount_text}    ${commence_date}    ${renewal_date}

*** Keywords ***
Add a new membership    
    [Arguments]    ${amount_text}    ${commence_date}    ${renewal_date}
    Fill the Login Form    Admin    admin123
    Click the My Info
    Click the Membership
    Click Add Button
    Select the appropriate Membership
    Select the appropriate Subscription
    Enter the valid amount    ${amount_text}
    Select the appropriate Currency
    Select the appropriate Commence Date    2023-12-05
    Select the appropriate Renewal Date    2024-11-01
    Click the Save button
    Verify the success message is displayed