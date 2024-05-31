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
    [Tags]    Regression
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.click on the delete button
    PIMResources.Click on the Yes Button
    PIMResources.Verify the employee is deleted

Edit Employee Details
    [Tags]    Regression
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.click on edit button