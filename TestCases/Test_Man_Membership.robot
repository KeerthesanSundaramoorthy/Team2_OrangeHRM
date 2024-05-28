*** Settings ***
Documentation   Verify the Membership feature 
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close the Browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/User.robot
Resource    ../Resources/Qualifications.robot
Resource    ../Resources/Membership.robot


*** Test Cases ***
Add the new membership 
    [Tags]    Retest
    [Documentation]    Add a new membership for the users     
    Fill the Login Form    Admin    admin123
    Click the My Info
    Click the Membership
    Click Add Button
    Select the appropriate Membership
    Click the Save button
    Verify the success message is displayed