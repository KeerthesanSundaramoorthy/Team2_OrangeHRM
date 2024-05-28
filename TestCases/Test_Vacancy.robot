*** Settings ***
Documentation    Test for Vacancy
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RecruitmentResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/PIMResources.robot

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
Vacancies
    [Tags]    UAT
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    LoginResources.verify the valid credentials
    RecruitmentResources.Click on Recruitment Icon
    RecruitmentResources.Click on Vacancies_button Icon
    RecruitmentResources.click on xpath for vacancy
    RecruitmentResources.DropDown Functionality    QA Lead
    PIMResources.click on search button
    ${count}    RecruitmentResources.check the count of record
    IF  '${count}'== '0'
        Log To Console    ${count} Records found
    ELSE
        Log To Console    ${count} Records Found
    
    END




