*** Settings ***
Documentation   The Resource contains the elements of the Dashboard Page 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${clock}    css:button[class='oxd-icon-button oxd-icon-button--solid-main orangehrm-attendance-card-action'][type='button']
${punch_out}    xpath=//div[@class='orangehrm-card-container']//h6
${pending}    xpath=(//div[@class='orangehrm-todo-list']//p)[1]
${review}    xpath=(//div[@class='orangehrm-todo-list']//p)[2]
${my_review}    xpath=//h6[contains(@class,'oxd-text oxd-text--h6 orangehrm-main-title')]
${candidates}    xpath=//h5[text()='Candidates']

*** Keywords ***
Click the Clock Icon
    Wait Until Element Is Visible    ${clock}
    Click Button    ${clock}

Verify the Punch out page is opened
    Page Should Contain Element    ${punch_out}    Punch Out

Click the Pending self review
    Wait Until Element Is Visible    ${pending}    10s
    Click Element    ${pending}

Verify the Performance Page is opened
    Page Should Contain Element    ${my_review}    My Review

Click the remaining candidates review
    Wait Until Element Is Visible    ${review}    10s
    Click Element    ${review}

Verify the Recruitment Page is opened
    Page Should Contain Element    ${candidates}    Candidates