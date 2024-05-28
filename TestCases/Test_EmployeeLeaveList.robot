*** Settings ***
Documentation    Test for Recruitment in employees on leave
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RecruitmentResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/EmployeeLeaveList.robot

**** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
List the employess on leave
    [Tags]    regression
    ${count}    EmployeeLeaveList.Get count of employees on leave
    Run Keyword If    ${count} == 0    Log To Console    ${count} Employees on leave    ELSE     EmployeeLeaveList.Log employee leave records


