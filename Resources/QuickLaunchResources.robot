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
    Click Element    ${Assign_leave}

Check it navigates to assign leave page
    Element Text Should Be    ${page_navigate}    Assign Leave

Click on Leave List Button
    Click Element    ${Leave_list}

#Assert Value
check it navigates to leave page
    Element Text Should Be    ${Leave_List_page_navigation}    Leave List

click on timesheet button
    Click Element   ${TimeSheet_Page}

check it navigates to timesheet
    Element Text Should Be    ${TimeSheet_page_navigates}    Select Employee

click on apply leave button
    Click Element    ${Apply_Leave}

check it navigates to apply leave
    Element Text Should Be    ${Apply_leave_navigates}    Apply Leave

click on apply my leave button
    Click Element    ${My_Leave}

check it navigates to my leave
    Element Text Should Be    ${My_leave_navigates}    My Leave List

click on apply my timesheet button
    Click Element    ${My_Timesheet}

check it navigates to my timesheet
    Element Text Should Be    ${My_timesheet_navigates}   No Records Found
