*** Settings ***
Documentation    Test for Employee List with all fields
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=EmployeeAllFields
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=InvalidEmployeeFileds
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    Employee Information with All fields except sub unit
 
*** Test Cases ***
Employee Information with All fields    ${Employee_Name}	${Employee_Id}	${Employee_Status}    ${include}    ${sup_name}    ${Job_Title}    ${Sub_Unit}

*** Variables ***
${username}    Admin   
${password}    admin123

*** Keywords ***
Employee Information with All fields except sub unit
    [Tags]    smoke
    [Arguments]    ${Employee_Name}	${Employee_Id}	${Employee_Status}    ${Job_Title}    ${Sub_Unit}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.Fill the Employee Information with name and id   ${Employee_Name}    ${Employee_Id}	
    PIMResources.Fill the Employee Information with xpath
    PIMResources.Dropdown functionality    ${Employee_Status}
    PIMResources.Fill the Employee Information with xpath
    PIMResources.Dropdown functionality    ${Job_Title}
    PIMResources.Click on search button
    ${count}    PIMResources.check the count of record
    IF  '${count}'== '0'
        Log To Console    ${count} Records found
    ELSE
        Log To Console    ${count} Records Found
    
    END

