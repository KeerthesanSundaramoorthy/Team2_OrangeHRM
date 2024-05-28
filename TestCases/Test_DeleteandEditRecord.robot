*** Settings ***
Documentation    Test for Delete and edit record on employee list
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot


*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
Delete Employee   
    [Tags]    regression
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.click on delete button
    PIMResources.Click the Yes Button
    PIMResources.Verify the employee is deleted

Edit Employee Details
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.click on edit button