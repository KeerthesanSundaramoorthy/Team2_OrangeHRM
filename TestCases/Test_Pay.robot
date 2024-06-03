*** Settings ***
Documentation    Verify the Pay Grade feature of the Admin
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Pay_Grade.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/PayGrade.robot
Test Template   Add a Pay Grade

*** Test Cases ***
Add the new Pay Grade    
    [Documentation]    Verifies the functions of the Pay Grade
    [Tags]    Smoke
    ${Pay_Grade}

*** Keywords ***
Add a Pay Grade 
    [Arguments]    ${Pay_Grade}
    Fill the Login Form    Admin    admin123
    Click the Admin button
    Click the Job
    Click the Pay Grade
    Click the Add Button
    Enter the Pay Grade    ${Pay_Grade}
    Click the Save button
    Verify the Pay Grade is added



