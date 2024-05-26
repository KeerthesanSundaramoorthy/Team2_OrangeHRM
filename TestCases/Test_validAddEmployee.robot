** Settings ***
Documentation    Test to add new Employee 
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Add_Employee.xlsx   sheet_name=AddEmployee
Library    DataDriver    file=../TestData/Invalid_Add_Employee.xlsx   sheet_name=InvalidAddEmployee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Test Template    Add Employee

*** Test Cases ***
Add Employee    ${first_name}    ${middle_name}    ${last_name}    

*** Test Cases ***
Invalid details for Add Employee    ${first_name}    ${middle_name}    ${last_name}

*** Keywords ***
Add Employee 
    PIMResources.Click on PIM Button
    PIMResources.click on add_employee
    [Arguments]    ${fname}    ${mname}    ${lname}    
    PIMResources.Fill the details to add employee    ${fname}    ${mname}    ${lname}
    Wait Until Element Is Visible    ${save_btn}    4s
    PIMResources.click on save button 
    Set Selenium Implicit Wait     4s

Invalid details for Add Employee
    PIMResources.Click on PIM Button
    PIMResources.click on add_employee
    [Arguments]    ${fname}    ${mname}    ${lname}    
    PIMResources.Fill the details to add employee    ${fname}    ${mname}    ${lname}
    Wait Until Element Is Visible    ${save_btn}    4s
    PIMResources.click on save button for invalid
    Set Selenium Implicit Wait     4s