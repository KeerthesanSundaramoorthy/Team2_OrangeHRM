*** Settings ***
Documentation    The PIM page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
${recruitment_icon}    xpath:(//span[@class="oxd-text oxd-text--span oxd-main-menu-item--name"])[5]
${candidate_icon}    xpath://a[text()='Candidates']
${Job_Title}    xpath://div[@class="oxd-select-text oxd-select-text--active"]
${vacancy_Title}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[2]

*** Keywords ***
Click on Recruitment Icon
    Click Link    ${recruitment_icon}

Click on Vacancies_button Icon
    Click Element    ${candidate_icon}

Click on Job Title button
    Click Element    ${Job_Title}
    Wait Until Element Is Visible    ${Job_Title}    5s
    Wait Until Element Is Enabled    ${Job_Title}    5s

Dropdown functionality
    [Arguments]    ${emp}
    Wait Until Element Is Visible    xpath://span[text()='${emp}']    5s
    Click Element    xpath://span[text()='${emp}']