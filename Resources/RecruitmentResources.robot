*** Settings ***
Documentation    The PIM page with objects and keywords 
Library    SeleniumLibrary

*** Variables ***
${recruitment_icon}    xpath:(//span[@class="oxd-text oxd-text--span oxd-main-menu-item--name"])[5]
${vacancy_icon}    xpath://a[text()='Vacancies']
${Job_Title}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[1]
${vacancy}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[2]
${Hiring_Manager}    xpath:(//div[@class='oxd-select-text oxd-select-text--active'])[3]
${Status}    xpath:(//div[@class="oxd-select-text oxd-select-text--active"])[4]

#Search,Save,Cancel and Reset
${search}    xpath://button[@type='submit']
${save_btn}    xpath://button[@type="submit"]
${cancel_btn}    xpath://button[@type="button" and @class="oxd-button oxd-button--medium oxd-button--ghost"]

#add new records
${add_btn}    xpath://button[normalize-space()='Add']
${vacancy_name}    xpath:(//input[@class="oxd-input oxd-input--active"])[2]
${job_title}    xpath://div[@class="oxd-select-text oxd-select-text--active"]
${Description}    xpath://textarea[@placeholder="Type description here"]
${hiring}    xpath://input[@placeholder="Type for hints..."]
${no_of_position}    xpath:(//input[@class="oxd-input oxd-input--active"])[3]

*** Keywords ***
Click on Recruitment Icon
    Click Element    ${recruitment_icon}

Click on Vacancies_button Icon
    Click Link    ${vacancy_icon}

Click on vacancy button
    Click Element    ${vacancy}
    Wait Until Element Is Visible    ${vacancy}    5s
    Wait Until Element Is Enabled    ${vacancy}    5s

Dropdown functionality
    [Arguments]    ${emp}
    Wait Until Element Is Visible    xpath://span[text()='${emp}']    5s
    Click Element    xpath://span[text()='${emp}']

Dropdown functionality for status
    [Arguments]    ${emp}
    Wait Until Element Is Visible    xpath://div[text()='${emp}']    5s
    Click Element    xpath://div[text()='${emp}']

Click on hiring_manager button
    Click Element    ${Hiring_Manager}
    Wait Until Element Is Visible    ${Hiring_Manager}    5s
    Wait Until Element Is Enabled    ${Hiring_Manager}    5s

Click on status button
    Click Element    ${Status}
    Wait Until Element Is Visible    ${Status}    5s
    Wait Until Element Is Enabled    ${Status}    5s

Click on search button
    Click Button    ${search}

#To add new entries for vacancy
Click on Vacancy Field on add Vaccancy
    Click Element    ${vacancy_name}
    Wait Until Element Is Visible    ${vacancy_name}    5s
    Wait Until Element Is Enabled    ${vacancy_name}    5s

Click on Job_Title on add vacancy
    [Arguments]    ${job}
    Input Text    ${job_title}    ${job}

Click on Description on add vacancy
    [Arguments]    ${desc}
    Input Text    ${Description}    ${desc}

Click on Hiring on add vacancy
    [Arguments]    ${hire_manager}
    Input Text    ${hiring}    ${hire_manager}

Click on number of vacancy on add vacancy
    [Arguments]    ${noVacancy}
    Input Text    ${no_of_position}    ${noVacancy}

Click on add new button
    Click Button    ${add_btn}