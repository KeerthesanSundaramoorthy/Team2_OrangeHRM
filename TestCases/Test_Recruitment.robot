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
Vacancies    ${Job_Title}

*** Keywords ***
Vacancies
    RecruitmentResources.Click on Recruitment Icon
    RecruitmentResources.Click on Vacancies_button Icon
    RecruitmentResources.Click on Job Title button
    RecruitmentResources.Dropdown functionality    ${Job_Title}




