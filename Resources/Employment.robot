*** Settings ***
Documentation   The Resource contains the elements of the Employment Status of the Admin Page 
Library    SeleniumLibrary


*** Variables ***
${employment}    xpath=(//ul[@class='oxd-dropdown-menu']//li)[3]
${employ_textbox}    xpath=//div[@class='oxd-input-group__label-wrapper']/following-sibling::div//input
${assert}    xpath=(//div[@class='oxd-toast-start']//p)[2]

*** Keywords ***
Click the Employment Status
    Wait Until Element Is Visible    ${employment}
    Click Element    ${employment}

Enter the Employment Status   
    [Arguments]    ${employ_text}
    Input Text    ${employ_textbox}    ${employ_text}

Verify the Employment Status is added
    Element Text Should Be    ${assert}    Successfully Saved


