*** Settings ***
Documentation    The Quick Launch page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
#Locators for icons
${Dashboard_icon}    xpath:(//span[@class="oxd-text oxd-text--span oxd-main-menu-item--name"])[8]
${Assign_leave}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[1]
${Leave_list}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[2]
${TimeSheet_Page}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[3]
${Apply_Leave}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[4]
${My_Leave}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[5]
${My_Timesheet}    xpath:(//button[@class="oxd-icon-button orangehrm-quick-launch-icon"]//*[local-name()='svg'])[6]

#Assert for navigation
${page_navigate}    xpath://div[@class='orangehrm-card-container']//h6
${Leave_List_page_navigation}    xpath://h5[text()='Leave List']
${TimeSheet_page_navigates}    xpath://div[@class="orangehrm-card-container"]//h6
${Apply_leave_navigates}    xpath://h6[text()='Apply Leave']
${My_leave_navigates}    xpath://h5[text()='My Leave List']
${My_timesheet_navigates}    xpath://p[text()='No Records Found']

*** Keywords ***
Click on Dashboard
    Click Element    ${Dashboard_icon}

Click on Assign Leave Button
    Wait Until Element Is Visible    ${Assign_leave}    5s
    Click Element    ${Assign_leave}

Check it navigates to assign leave page
    Wait Until Element Is Visible    ${Page_navigate}    5s
    Element Text Should Be    ${page_navigate}    Assign Leave

Click on Leave List Button
    Wait Until Element Is Visible    ${Leave_list}    10s
    Click Element    ${Leave_list}

#Assert Value
check it navigates to leave page
    Wait Until Element Is Visible    ${Leave_List_page_navigation}    5s
    Element Text Should Be    ${Leave_List_page_navigation}    Leave List

click on timesheet button
    Wait Until Element Is Visible    ${TimeSheet_Page}    5s
    Click Element   ${TimeSheet_Page}

check it navigates to timesheet
    Wait Until Element Is Visible    ${TimeSheet_page_navigates}    5s
    Element Text Should Be    ${TimeSheet_page_navigates}    Select Employee

click on apply leave button
    Wait Until Element Is Visible    ${Apply_Leave}    5s
    Click Element    ${Apply_Leave}

check it navigates to apply leave
    Wait Until Element Is Visible    ${Apply_leave_navigates}    5s
    Element Text Should Be    ${Apply_leave_navigates}    Apply Leave

click on apply my leave button
    Wait Until Element Is Visible    ${My_Leave}    5s
    Click Element    ${My_Leave}

check it navigates to my leave
    Wait Until Element Is Visible    ${My_leave_navigates}    5s
    Element Text Should Be    ${My_leave_navigates}    My Leave List

click on apply my timesheet button
    Wait Until Element Is Visible    ${My_Timesheet}    5s
    Click Element    ${My_Timesheet}

check it navigates to my timesheet
    Wait Until Element Is Visible    ${My_timesheet_navigates}    5s
    Element Text Should Be    ${My_timesheet_navigates}   No Records Found
