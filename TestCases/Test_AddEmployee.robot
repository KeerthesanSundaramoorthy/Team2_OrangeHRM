*** Settings ***
Documentation    Test for Add Employee
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Add_Employee.xlsx   sheet_name=AddEmployee
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    Add new Employee  

*** Test Cases ***
Add new Employee    
    [Tags]   Retest
    ${emp_name}    ${emp_id}    ${emp_status}    ${include}    ${sup_name}    ${job_title}    ${sub_unit}

*** Variables ***
${username}    Admin   
${password}    admin123

*** Keywords ***
Add new Employee
    [Arguments]   ${fname}    ${mname}    ${lname}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    GenericResources.Click the Add Button    
    PIMResources.Fill the details to add employee    ${fname}    ${mname}    ${lname}
    Wait Until Element Is Visible    ${save_btn}    4s
    PIMResources.click on save button
    PIMResources.check for successful save 
