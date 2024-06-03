** Settings ***
Documentation    Test to add new Employee with invalid details
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Invalid_Add_Employee.xlsx   sheet_name=InvalidAddEmployee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot
Test Template      Invalid details for Add Employee

*** Test Cases ***
Invalid details for Add Employee    
    [Tags]    Smoke
    ${first_name}    ${middle_name}    ${last_name}

*** Variables ***
${username}    Admin   
${password}    admin123


*** Keywords ***
Invalid details for Add Employee
    [Arguments]    ${invalid_fname}	${invalid_mname}	${invalid_lname}    
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on add_employee
    PIMResources.Fill the details to add employee    ${invalid_fname}	${invalid_mname}	${invalid_lname}
    Wait Until Element Is Visible    ${save_btn}    4s
    PIMResources.click on save button for invalid
    Wait Until Element Is Visible    ${save_btn}    5s
    PIMResources.check for invalid message for report