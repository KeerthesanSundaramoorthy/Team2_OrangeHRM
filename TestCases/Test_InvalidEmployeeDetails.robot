*** Settings ***
Documentation    Test for Invalid Employee Details
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Employee_information.xlsx   sheet_name=InvalidEmployeeFileds
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    Employee Information with invalid field
 
*** Test Cases ***
Employee Information with invalid field    
    [Tags]    Regression 
    ${InvalidEmployee_Name}	${InvalidEmployee_Id}   

*** Variables ***
${username}    Admin   
${password}    admin123

*** Keywords ***
Employee Information with invalid field   
    [Arguments]    ${InvalidEmployee_Name}	${InvalidEmployee_Id}	
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    PIMResources.Click on PIM Button
    PIMResources.click on Employee_list_button
    PIMResources.Fill the Employee Information with name and id   ${InvalidEmployee_Name}    ${InvalidEmployee_Id}	
    PIMResources.Click on search button
    PIMResources.check for invalid cases record

