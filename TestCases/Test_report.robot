** Settings ***
Documentation    Test to generate report
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Reports.xlsx   sheet_name=Report
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    Reports

*** Test Cases ***
Reports    ${reports}    

*** Variables ***
${username}    Admin   
${password}    admin123

*** Keywords ***
Reports 
    [Tags]    regresion
    [Arguments]    ${report_name}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    PIMResources.Click on PIM Button
    PIMResources.click on report field
    PIMResources.Fill reports name    ${report_name}
    PIMResources.Dropdown functionality    ${report_name}
    PIMResources.click on search button

Reports to reset the field
    [Arguments]    ${Job_Title}    ${report_name}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    PIMResources.Click on PIM Button
    PIMResources.click on report field
    PIMResources.Fill reports name    ${report_name}
    PIMResources.Dropdown functionality    ${report_name}
    PIMResources.Click on reset button


