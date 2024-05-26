** Settings ***
Documentation    Test to add new Employee with invalid details
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Invalid_Add_Employee.xlsx   sheet_name=InvalidAddEmployee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Test Template      Invalid details for Add Employee

*** Test Cases ***
Invalid details for Add Employee    ${first_name}    ${middle_name}    ${last_name}

*** Keywords ***
Invalid details for Add Employee
    PIMResources.Click on PIM Button
    PIMResources.click on add_employee
    [Arguments]    ${invalid_fname}	${invalid_mname}	${invalid_lname}    
    PIMResources.Fill the details to add employee    ${invalid_fname}	${invalid_mname}	${invalid_lname}
    Wait Until Element Is Visible    ${save_btn}    4s
    PIMResources.click on save button for invalid
    Wait Until Element Is Visible    ${save_btn}    5s