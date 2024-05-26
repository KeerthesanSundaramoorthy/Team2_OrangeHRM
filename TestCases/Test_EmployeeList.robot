*** Settings ***
Documentation    Test for Employee List
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=Employee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Test Template    Employee Information 

*** Test Cases ***
Employee Information    ${emp_name}    ${emp_id}    ${emp_status}    ${include}    ${sup_name}    ${job_title}    ${sub_unit}

*** Keywords ***

Employee Information 
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    [Arguments]    ${Employee_Name}	${Employee_Id}	${Employee_Status}    ${Job_Title}    ${Sub_Unit}
    PIMResources.Fill the Employee Information with name and id   ${Employee_Name}    ${Employee_Id}	
    PIMResources.Fill the Employee Information with employee status 
    PIMResources.Dropdown functionality    ${Employee_Status}
    PIMResources.Fill the Employee Information with job title
    PIMResources.Dropdown functionality    ${Job_Title}
    PIMResources.Fill the Employee Information with sub unit
    PIMResources.Dropdown functionality    ${Sub_Unit}
    PIMResources.Click on search button

Employee Information with name and id
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    [Arguments]    ${Employee_Name}	${Employee_Id}	${Employee_Status}    ${Job_Title}    ${Sub_Unit}
    PIMResources.Fill the Employee Information with name and id   ${Employee_Name}    ${Employee_Id}
    PIMResources.Click on search button

