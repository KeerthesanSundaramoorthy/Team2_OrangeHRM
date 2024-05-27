*** Settings ***
Documentation    The employeeleave list page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
#Locators to count total record
${employee_list_parent}    xpath:(//div[@class="orangehrm-dashboard-widget-body"])[4]
${employee_record}         xpath:(//div[@class="orangehrm-dashboard-widget-body"])[4]//div


*** Keywords ***
#Employee count
Get count of employees on leave
    ${count}    Get Element Count    ${employee_list_parent}
    RETURN   ${count}

#list out the leave records
Log employee leave records
    ${count}    Get count of employees on leave
    FOR    ${index}    IN RANGE    ${count}
        ${record}    Get Text    xpath=(${employee_record})[${index}+1]
        Log To Console    Employee ${index + 1}: ${record}
    END