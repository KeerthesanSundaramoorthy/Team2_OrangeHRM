** Settings ***
Documentation    Test to add new Employee 
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Reports.xlsx   sheet_name=Report
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/PIMResources.robot
Test Template    Reports

*** Test Cases ***
Reports    ${reports}    

*** Keywords ***
Reports 
    PIMResources.Click on PIM Button
    PIMResources.click on report field
    [Arguments]    ${report_name}
    PIMResources.Fill reports name    ${report_name}
    PIMResources.Dropdown functionality    ${report_name}
    PIMResources.click on search button

Reports to reset the field
    PIMResources.Click on PIM Button
    PIMResources.click on report field
    [Arguments]    ${report_name}
    PIMResources.Fill reports name    ${report_name}
    PIMResources.Dropdown functionality    ${report_name}
    PIMResources.Click on reset button

Reports to check invalid field
    PIMResources.Click on PIM Button
    PIMResources.click on report field
    [Arguments]    ${report_name}
    PIMResources.Fill reports name    ${report_name}
    PIMResources.Dropdown functionality    No Records Found
    PIMResources.click on search button
