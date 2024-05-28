*** Settings ***
Documentation   Verify the Qualification feature of the Employee
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close the Browser
Library    DataDriver    file=../TestData/Pay_Grade.xlsx    sheet_name=Sheet5
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/User.robot
Resource    ../Resources/Configurations.robot
Resource    ../Resources/Qualifications.robot
Test Template   Add new Work Experience

*** Test Cases ***
Add the new work Experience      ${send_email_id}    ${test_email_id}

*** Keywords ***
Add new Work Experience
    Fill the Login Form    Admin    admin123
    Click the My Info
    Click the Qualifications
    Click the Add Button
    Enter the Company Name
    Enter the Job Title
    Enter the From Date
    Enter the To Date
    Enter the Comment
    Click the Save button