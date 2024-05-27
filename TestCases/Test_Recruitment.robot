*** Settings ***
Documentation    Test for Recruitment
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Candidate_Details.xlsx   sheet_name=Candidate 
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RecruitmentResources.robot
Test Template    Vacancies

*** Test Cases ***
Vacancies by    ${Job_Title}	${Vacancy}    ${Hiring_Manager}    ${Status}	${Candidate_Name}	${Keywords}	    ${Date_Of_Application}    ${Date_Of_Application_To}    ${Hiring Manager}


*** Keywords ***
Vacancies
    Input Text    xpath://input[@placeholder="Username"]    Admin
    Input Password    xpath://input[@placeholder="Password"]    admin123
    Click Button    xpath://button[@type='submit']
    [Arguments]    ${Vacancy}    ${Status}
    RecruitmentResources.Click on Recruitment Icon
    RecruitmentResources.Click on Vacancies_button Icon
    RecruitmentResources.Click on vacancy button
    RecruitmentResources.Dropdown functionality    ${vacancy}
    RecruitmentResources.Click on status button
    RecruitmentResources.Dropdown functionality   ${Status}
    RecruitmentResources.Click on search button



