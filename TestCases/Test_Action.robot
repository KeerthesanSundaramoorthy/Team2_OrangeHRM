*** Settings ***
Documentation   Verifies the My Action feature of the Admin
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/Dashboard.robot

*** Test Cases ***

Verify the Time at Work Feature   
    [Documentation]    Verifies the Punch out time page is opened
    [Tags]    Smoke
    Fill the Login Form    Admin    admin123
    Click the Clock Icon
    Verify the Punch out page is opened

Verify the Pending review 
    [Documentation]    Verifies the My Review page is opened
    [Tags]    Smoke
    Fill the Login Form    Admin    admin123
    Click the Pending self review
    Verify the Performance Page is opened

Verify the Candidates review
    [Documentation]    Verifies the Candidate page is opened
    [Tags]    Retest
    Fill the Login Form    Admin    admin123
    Click the remaining candidates review
    Verify the Recruitment Page is opened
    

