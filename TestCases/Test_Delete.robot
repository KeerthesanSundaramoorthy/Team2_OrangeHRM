*** Settings ***
Documentation    Test for Employee List
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=Employee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Test Template    Delete Employee Information

*** Test Cases ***
Delete Employee Information    ${emp_name}    ${emp_id}    ${emp_status}    ${include}    ${sup_name}    ${job_title}    ${sub_unit}

*** Keywords ***
Delete Employee Information
        ELSE IF    '${condition}'=='Delete'
        PIMResources.Click on Delete Button
        PIMResources.Click the Yes Button
        PIMResources.Verify the Employee is deleted