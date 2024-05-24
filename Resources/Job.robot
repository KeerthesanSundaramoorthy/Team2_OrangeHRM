*** Settings ***
Documentation   The Resource contains the elements of the Job Feature of the Admin Page 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${job}    xpath=(//i[@class='oxd-icon bi-chevron-down']/ancestor::span)[2]
${job_titles}    xpath=(//ul[@class='oxd-dropdown-menu']//li)[1]
${add_button}    xpath=//button[@type="button"][@class="oxd-button oxd-button--medium oxd-button--secondary"]
${job_text}    xpath=(//div[@data-v-957b4417]//input)[1]
${job_desc}    xpath=(//div[@data-v-957b4417]//textarea)[1]
${job_note}    xpath=(//div[@data-v-957b4417]//textarea)[2]
${cancel_button}    xpath=(//p[@class='oxd-text oxd-text--p orangehrm-form-hint']//following-sibling::button)[1]
${save_button}    xpath=(//p[@class='oxd-text oxd-text--p orangehrm-form-hint']//following-sibling::button)[2]
${success}    xpath=(//div[@class='oxd-toast-content oxd-toast-content--success']//p)[1]


*** Keywords ***
Enter the Job Title    
    [Arguments]    ${Job_title}
    Input Text    ${job_text}    ${Job_title}    

Enter the Job Description
    [Arguments]    ${Job_des}
    Input Text    ${job_desc}    ${Job_des}

Enter the Job Note
    [Arguments]    ${Job_note}
    Input Text    ${job_note}    ${Job_note}

Click the Save button
    Click Button    ${save_button}

Click the Cancel button
    Click Button    ${cancel_button}

Verify the job is added
    Element Text Should Be    ${success}    Success

    


