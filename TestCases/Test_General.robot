*** Settings ***
Documentation    Verify the General Information feature of the Organization
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenInfo.robot

*** Test Cases ***

Verify the Text Box is enabled    
    [Documentation]    Verifies the text box is enabled
    [Tags]    Smoke
    Fill the Login Form    Admin    admin123
    Click the Admin button
    Click the Organization
    Click the General Information
    Click the Edit
    Verify the Text Box is enabled

Edit the Organization Name
    [Documentation]    Verify the Organization name can be editable 
    [Tags]    Smoke
    Fill the Login Form    Admin    admin123
    Click the Admin button
    Click the Organization
    Click the General Information
    Click the Edit
    Enter the Organization Name
    Click Save button
    Verify the Organization name is changed
    
