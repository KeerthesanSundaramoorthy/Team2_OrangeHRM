*** Settings ***
Documentation    Test for Employee List
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=Employee  
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot


Test Template    Employee Information 

*** Test Cases ***
Employee Information    
    [Tags]    Smoke   
    ${emp_name}    ${emp_id}    ${emp_status}    ${include}    ${sup_name}    ${job_title}    ${sub_unit}

*** Variables ***
${username}    Admin   
${password}    admin123

*** Keywords ***

Employee Information
    [Arguments]    ${Employee_Name}    ${Employee_Id}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.Fill the Employee Information with name and id   ${Employee_Name}    ${Employee_Id}
    PIMResources.Click on search button
    ${count}    PIMResources.check the count of record
    IF  '${count}'== '0'
        Log To Console    ${count} Records found
    ELSE
        Log To Console    ${count} Records Found
    
    END



