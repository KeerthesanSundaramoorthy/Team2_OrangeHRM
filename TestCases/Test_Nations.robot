*** Settings ***
Documentation   Add the New Nationality of the Admin
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Pay_Grade.xlsx    sheet_name=Sheet4
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/Nations.robot
Test Template   Add the new Nation

*** Test Cases ***
Add a new Nation    
    [Tags]    Retest
    [Documentation]    Add a new Nation for the Organization with all the fields
    ${condition}    ${nation_name} 

*** Keywords ***
Add the new Nation
    [Arguments]    ${condition}    ${nation_name}
    Fill the Login Form    Admin    admin123
    Click the Admin button
    Click the Nationalities
    Click the Add Button
    Enter the Nation Name    ${nation_name}
    Click the Save Button
    IF  '${condition}'=='new'
        Verify the new nation is added

    ELSE IF    '${condition}'=='existing'
        Verify the existing message

    END