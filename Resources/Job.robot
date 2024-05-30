*** Settings ***
Documentation   The Resource contains the elements of the Job Feature of the Admin Page 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${job}    xpath=(//div[@class='oxd-topbar-body']//span)[2]
${job_titles}    xpath=(//ul[@class='oxd-dropdown-menu']//li)[1]
${add_button}    xpath=//button[@type="button"][@class="oxd-button oxd-button--medium oxd-button--secondary"]
${job_text}    xpath=(//div[@data-v-957b4417]//input)[1]
${job_desc}    xpath=(//div[@data-v-957b4417]//textarea)[1]
${jb_note}    xpath=(//div[@class='oxd-input-group oxd-input-field-bottom-space'])[4]//textarea
${cancel_button}    xpath=(//p[@class='oxd-text oxd-text--p orangehrm-form-hint']//following-sibling::button)[1]
${trash}    xpath=(//i[@class='oxd-icon bi-trash'])[1]
${success_deleted}    //p[text()='Successfully Deleted']
${yes_del}    //button[text()=' Yes, Delete ']

*** Keywords ***
Click the Job 
    Wait Until Element Is Visible    ${job}
    Click Element    ${job}

Click the Job Titles
    Wait Until Element Is Visible    ${job_titles}
    Click Element    ${job_titles}

Enter the Job Title    
    [Arguments]    ${Job_title}
    Wait Until Element Is Visible    ${job_text}    5s
    Input Text    ${job_text}    ${Job_title}    

Enter the Job Description
    [Arguments]    ${Job_des}
    Wait Until Element Is Visible    ${job_desc}    5s
    Input Text    ${job_desc}    ${Job_des}

Enter the Job Note
    [Arguments]    ${Job_Note}
    Wait Until Element Is Visible    ${jb_note}    5s
    Input Text    ${jb_note}    ${Job_Note}

Click the Cancel button
    Wait Until Element Is Visible    ${cancel_button}    10s
    Click Button    ${cancel_button}

Verify the previous page
    Wait Until Element Is Visible    ${trash}    10s
    Element Should Be Visible    ${trash}

Click the Delete Button
    Wait Until Element Is Visible    ${trash}    10s
    Click Element    ${trash}

Click the Yes Button
    Wait Until Element Is Visible    ${yes_del}    10s
    Click Button    ${yes_del}

Verify the Job is deleted
    Wait Until Element Is Visible    ${success_deleted}    10s
    Element Should Be Visible    ${success_deleted}


