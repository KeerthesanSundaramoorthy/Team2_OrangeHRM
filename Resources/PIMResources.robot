*** Settings ***
Documentation    The PIM page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
${count_record}    xpath://div[@class="orangehrm-container"]
${Employee_list}    xpath://a[text()='Employee List']
${PIM_button}    xpath:(//span[@class="oxd-text oxd-text--span oxd-main-menu-item--name"])[2]
${Employee_Name_Xpath}    xpath:(//input[@placeholder="Type for hints..."])
${Employee_Id_Xpath}    xpath:(//input[@class="oxd-input oxd-input--active"])[2]
${Employee_Status_Dropdown}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])
${Include_Xpath}    xpath:(//div[@class="oxd-select-text-input"])[2]
${Job_Title_Xpath}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])[2]
${Sub_Unit_Xpath}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])[3]
${Reset}    xpath://button[@class="oxd-button oxd-button--medium oxd-button--ghost"]
${Search}    xpath://button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${error_message}    xpath://span[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]

#Add Employee
${Add_employee}    xpath://a[text()='Add Employee']
${first_name}    xpath://input[@name="firstName"]
${middle_name}    xpath://input[@name="middleName"]
${last_name}    xpath://input[@name="lastName"]
${save_btn}    xpath://button[@type="submit"]
${cancel_btn}    xpath://button[@type="button" and @class="oxd-button oxd-button--medium oxd-button--ghost"]

#Reports
${reports}    xpath:(//a[@class="oxd-topbar-body-nav-tab-item"])[3]
${report_name}    xpath://input[@placeholder="Type for hints..."]
${report_error}    No Records Found

#delete
${delete_btn}    xpath://i[@class="oxd-icon bi-trash"]
${record_delete}    xpath://div[@class="orangehrm-container"]

*** Keywords ***
Click on PIM Button
    Set Selenium Implicit Wait    5
    Click Element    ${PIM_button}

click on Employee_list_button
    Click Element    ${Employee_list}

click on add_employee
    Click Element    ${Add_employee}

Fill the Employee Information with employee status
    Click Element    ${Employee_Status_Dropdown}
    Wait Until Element Is Visible    ${Employee_Status_Dropdown}    5s
    Wait Until Element Is Enabled    ${Employee_Status_Dropdown}    5s
    
Fill the Employee Information with job title
    Click Element    ${Job_Title_Xpath}
    Wait Until Element Is Visible    ${Job_Title_Xpath}    5s
    Wait Until Element Is Enabled    ${Job_Title_Xpath}    5s

Fill the Employee Information with sub unit
    Click Element    ${Sub_Unit_Xpath}
    Wait Until Element Is Visible    ${Sub_Unit_Xpath}    5s
    Wait Until Element Is Enabled    ${Sub_Unit_Xpath}    5s

Dropdown functionality
    [Arguments]    ${emp}
    Wait Until Element Is Visible    xpath://span[text()='${emp}']    5s
    Click Element    xpath://span[text()='${emp}']

Report generation
    Click Element    ${report_name}
    Wait Until Element Is Visible    ${report_name}    5s
    Wait Until Element Is Enabled    ${report_name}    5s

Fill the Employee Information with name and id
    
    [Arguments]    ${emp_name}    ${emp_id}    
    Input Text    ${Employee_Name_Xpath}    ${emp_name}
    Input Text    ${Employee_Id_Xpath}    ${emp_id}
    
Fill the details to add employee
    [Arguments]    ${fname}    ${mname}    ${lname}
    Input Text    ${first_name}    ${fname}
    Input Text    ${middle_name}    ${mname}
    Input Text    ${last_name}    ${lname}

click on save button 
    Click Button    ${save_btn}
    Page Should Contain    Successfully Saved

click on save button for invalid
    Click Button    ${save_btn}
    Element Should Be Visible    ${error_message}

Clickssss on search button
    Click Button    ${Search}
    ${count}    Get Element Count    ${count_record}
    Should Be Equal As Integers    ${count}    1

Click on reset button
    Click Button    ${Reset}

click on cancel button
    Click Button    ${cancel_btn}

click on report field
    Click Element    ${reports}

Fill reports name
    [Arguments]    ${report}
    Input Text    ${report_name}    ${report}

    
click on search button
    Click Button    ${Search}

click on delete button
    Click Button    ${delete_btn}

check for invalid message for report
    Element Should Be Visible    ${error_message}