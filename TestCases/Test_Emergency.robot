*** Settings ***
Documentation        Test emergency contact to my info page
Library              SeleniumLibrary
Library              DataDriver    file=../TestData/EmergencyContactData.xlsx    sheet_name=emergency
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/EmergencyContactResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved personal details

*** Variables ***
${username}    Admin   
${password}    admin123


*** Test Cases ***
fill the form of personal details    ${NAMES}    ${RELATION}    ${HOMES}    

*** Keywords ***
#To validate successful saved personal details
validate successful saved personal details
    [Tags]    Smoke
    [Arguments]     ${NAMES}    ${RELATION}    ${HOMES}    
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click emergency contact element
    EmergencyContactResources.click add button
    EmergencyContactResources.Fill the details to mandatory field    ${NAMES}    ${RELATION}    ${HOMES}    
    EmergencyContactResources.Click Save Button