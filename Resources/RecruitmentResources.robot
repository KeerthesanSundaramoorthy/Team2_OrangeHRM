*** Settings ***
Documentation    The Recruitment page with objects and keywords 
Library    SeleniumLibrary


*** Variables ***
${recruitment_icon}    xpath:(//a[@class="oxd-main-menu-item"])[5]
${vacancies_icon}    xpath://a[text()='Vacancies']


#Record
${record}    xpath://div[@class="oxd-table-body oxd-card-table-body"]
#Candidate 
${Candidate_icon}    xpath://a[text()='Candidates']
${xpath_search}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[2]

#Vacancy
${Xpath_Vacancy}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[1]

*** Keywords ***
Click on Recruitment Icon
    Click Link    ${recruitment_icon}

Click on Vacancies_button Icon
    Click Element    ${vacancies_icon}

Dropdown functionality
    [Arguments]    ${emp}
    Wait Until Element Is Visible    xpath://span[text()='${emp}']    5s
    Click Element    xpath://span[text()='${emp}']

click on candidate icon
    Click Element    ${Candidate_icon}

click on xpath to search candidate
    Click Element    ${xpath_search}
    Wait Until Element Is Visible    ${xpath_search}    5s
    Wait Until Element Is Enabled    ${xpath_search}    5s

click on xpath for vacancy
    Click Element    ${Xpath_Vacancy}
    Wait Until Element Is Visible    ${Xpath_Vacancy}    10s
    Wait Until Element Is Enabled    ${Xpath_Vacancy}    10s

check the count of record
    ${counts}    Get Element Count    ${record}
    RETURN    ${counts}