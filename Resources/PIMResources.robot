*** Settings ***
Documentation    The PIM page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
#count for employee list
${count_record}    xpath://div[@class="oxd-table orangehrm-employee-list"]
${No_record}    xpath://p[@class="oxd-text oxd-text--p oxd-text--toast-message oxd-toast-content-text"]
#Employee list
${Employee_list}    xpath://a[text()='Employee List']
${PIM_button}    xpath:(//span[@class="oxd-text oxd-text--span oxd-main-menu-item--name"])[2]
${Employee_Name_Xpath}    xpath:(//input[@placeholder="Type for hints..."])
${Dropdown_xpath}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])[1]
${Employee_Id_Xpath}    xpath:(//input[@class="oxd-input oxd-input--active"])[2]
${Status}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])[1]
${Include_Xpath}    xpath:(//div[@class="oxd-select-text-input"])[2]
${Job_Title_Xpath}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"][normalize-space()='-- Select --'])[1]
${Sub_Unit_Xpath}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[4]
${Reset}    xpath://button[@class="oxd-button oxd-button--medium oxd-button--ghost"]
${Search}    xpath://button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
${error_message}    xpath://span[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${success_message}    xpath=(//div[@class='oxd-toast-content oxd-toast-content--success']//p)[1]
${Page_navigate}    xpath://h6[text()='PIM']

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
${delete_btn}    xpath:(//button/i[@class="oxd-icon bi-trash"])[5]
${yes_del_btn}    xpath:(//div[@class='orangehrm-modal-footer']//button)[2]
${success_deleted}    xpath://p[text()='Successfully Deleted']

#Edit
${edit_btn}    xpath:(//i[@class="oxd-icon bi-pencil-fill"])[5]

#javascript locators
#${Employee_name_queryselector}    document.querySelector("input[placeholder='Type for hints...']")
#${Sub_unit_queryselector}    (document.getElementsByClassName("oxd-select-text oxd-select-text--active"))[3]
#{Reset_querySselector}    document.querySelector("button[class='oxd-button oxd-button--medium oxd-button--ghost']")
#{Search_querselector}    document.getElementsByClassName("oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space")

*** Keywords ***
Click on PIM Button
    Set Selenium Implicit Wait    5
    Click Element    ${PIM_button}

click on Employee_list_button
    Click Element    ${Employee_list}

click on add_employee
    Click Element    ${Add_employee}

#Employee Status
Fill the Employee Information with employee status
    Click Element    ${Status}
    Wait Until Element Is Visible    ${Status}    5s
    Wait Until Element Is Enabled    ${Status}    5s
    
#Sub Unit
Fill the Employee Information with sub unit
    Click Element    ${Sub_Unit_Xpath}
    Wait Until Element Is Visible    ${Sub_Unit_Xpath}    5s
    Wait Until Element Is Enabled    ${Sub_Unit_Xpath}    5s

#Xpath
Fill the Employee Information with xpath
    Click Element    ${Dropdown_xpath}
    Wait Until Element Is Visible    ${Dropdown_xpath}    5s
    Wait Until Element Is Enabled    ${Dropdown_xpath}    5s

#To select particular element
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

#To add new employee
Fill the details to add employee
    [Arguments]    ${fname}    ${mname}    ${lname}
    Input Text    ${first_name}    ${fname}
    Input Text    ${middle_name}    ${mname}
    Input Text    ${last_name}    ${lname}

#To save the record
click on save button 
    Click Button    ${save_btn}

#To save the details using invalid
click on save button for invalid
    Click Button    ${save_btn}
    Element Should Be Visible    ${error_message}

#Count the records
check the count of record
    ${count}    Get Element Count    ${count_record}
    RETURN    ${count}

Click on reset button
    Click Button    ${Reset}

click on cancel button
    Click Button    ${cancel_btn}

#TO get report field
click on report field
    Click Element    ${reports}

#Fill Report Name
Fill reports name
    [Arguments]    ${report}
    Input Text    ${report_name}    ${report}

#Search button
click on search button
    Wait Until Element Is Visible    ${Search}    5s
    Click Button    ${Search}

#Delete Button
click on the delete button
    Wait Until Element Is Visible    ${delete_btn}    
    Click Element    ${delete_btn}

#Pop up yes button
Click on the Yes Button
    Wait Until Element Is Visible    ${yes_del_btn}
    Click Element    ${yes_del_btn}

#Deleted Message
Verify the employee is deleted
    Wait Until Element Is Visible    ${success_deleted}    5s
    Element Should Be Visible    ${success_deleted}    Successfully Deleted

#invalid error message is shown
check for invalid message for report
    Wait Until Element Is Visible    ${error_message}
    Element Should Be Visible    ${error_message}   

#Successfully saved message
check for successful save 
    Wait Until Element Is Visible    ${success_message}    10s
    Wait Until Element Contains    ${success_message}    Success    10s
    Element Text Should Be    ${success_message}    Success


#Page navigates
check whether page navigates to Personal info
    Wait Until Element Is Visible    ${Page_navigate}    5s
    Element Text Should Be    ${Page_navigate}    PIM

#No REcords Message
check for invalid cases record
    Wait Until Element Is Visible    ${No_record}    5s
    Element Text Should Be    ${No_record}    No Records Found

#Edit button functionality
click on edit button
    Wait Until Element Is Visible    ${edit_btn}
    Click Element    ${edit_btn}
    Element Text Should Be    ${Page_navigate}    PIM