*** Settings ***
Documentation    Test for Candidate Search
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
Candidate Search
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    RecruitmentResources.Click on Recruitment Icon
    RecruitmentResources.click on candidate icon
    RecruitmentResources.click on xpath to search candidate   
    RecruitmentResources.Dropdown functionality    Senior QA Lead
    PIMResources.click on search button
    ${count}    PIMResources.check the count of record
    IF  '${count}'== '0'
        Log To Console    ${count} Records found
    ELSE
        Log To Console    ${count} Records Found
    END