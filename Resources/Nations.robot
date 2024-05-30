*** Settings ***
Documentation   The Resource contains the elements of the General information about the Organization 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${nationalities}    xpath=//div[@class='oxd-topbar-body']//a
${nation_textbox}    xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${existing}    xpath=//span[text()='Already exists']
${assert}    xpath=(//div[@class='oxd-toast-start']//p)[2]

*** Keywords ***
Click the Nationalities
    Wait Until Element Is Visible    ${nationalities}    10s
    Click Element    ${nationalities}

Enter the Nation Name
    [Arguments]    ${nation_name}
    Wait Until Element Is Visible    ${nation_textbox}    10s
    Input Text    ${nation_textbox}    ${nation_name}

Verify the existing message
    Wait Until Element Is Visible    ${existing}    10s
    Element Text Should Be    ${existing}    Already exists

Verify the new nation is added
    Wait Until Element Is Visible    ${assert}    10s
    Element Text Should Be    ${assert}    Successfully Saved

    