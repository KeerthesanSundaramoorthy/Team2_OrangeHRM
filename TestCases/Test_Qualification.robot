*** Settings ***
Documentation   Verify the Qualification feature of the Employee
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Qualification.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/Configurations.robot
Resource    ../Resources/Qualifications.robot
Test Template   Add new Work Experience

*** Test Cases ***
Add the new work Experience    
    [Documentation]    Add the new work experience for the employee with all the fields
    [Tags]    Smoke
    ${com_text}    ${job_text}    ${from_dat}    ${to_dat}    ${comment_text}

*** Keywords ***
Add new Work Experience    
    [Arguments]    ${com_text}    ${job_text}    ${from_dat}    ${to_dat}    ${comment_text}
    Fill the Login Form    Admin    admin123
    Click the My Info
    Click the Qualifications
    Click Add Button
    Enter the Company Name    ${com_text}
    Enter the Job Title    ${job_text}
    Enter the From Date    ${from_dat}
    Enter the To Date    ${to_dat}
    Enter the Comment    ${comment_text}
    Click the Save button
    Verify the new qualification is added