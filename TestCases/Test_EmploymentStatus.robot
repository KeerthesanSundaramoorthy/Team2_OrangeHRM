*** Settings ***
Documentation    Verify the Employment Status feature of the Admin
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Pay_Grade.xlsx    sheet_name=Sheet2
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/Job.robot
Resource    ../Resources/Employment.robot
Test Template   Add a Employment Status

*** Test Cases ***
Add the Employment Status    
    [Tags]    Smoke
    [Documentation]    Adds the new Employment Status for the user 
    ${Employment_Status}

*** Keywords ***
Add a Employment Status 
    [Arguments]    ${Employment_Status}
    Fill the Login Form    Admin    admin123
    Click the Admin button
    Click the Job
    Click the Employment Status
    Click the Add Button
    Enter the Employment Status    ${Employment_Status}
    Click the Save button
    Verify the Employment Status is added



