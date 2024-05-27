*** Settings ***
Documentation    Test for Recruitment
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Add_Vacancy.xlsx  sheet_name=AddVacancy
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RecruitmentResources.robot
Test Template    Add_Vacancies

*** Test Cases ***
Vacancies by    ${Job_Title}	${Vacancy}    ${Hiring_Manager}    ${Description}	${No_Of_Position}

*** Keywords ***
Add_Vacancies
    Input Text    xpath://input[@placeholder="Username"]    Admin
    Input Password    xpath://input[@placeholder="Password"]    admin123
    Click Button    xpath://button[@type='submit']
    RecruitmentResources.Click on Recruitment Icon
    RecruitmentResources.Click on Vacancies_button Icon
    RecruitmentResources.Click on add new button
    [Arguments]     ${Job_Title}	${Vacancy}    ${Description}    ${Hiring}	${No_Of_Pasition}
    RecruitmentResources.Click on Job_Title on add vacancy    ${Job_Title}
    RecruitmentResources.Click on Vacancy Field on add Vaccancy
    RecruitmentResources.Dropdown functionality    ${Vacancy}
    RecruitmentResources.Click on Description on add vacancy    ${Description}
    RecruitmentResources.Click on Hiring on add vacancy    ${Hiring}
    RecruitmentResources.Click on number of vacancy on add vacancy    ${No_Of_Position}
    