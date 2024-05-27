*** Settings ***
Documentation   The Resource contains the elements of the Qualification Page on the My Info
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${membership}    css:a[href="/web/index.php/pim/viewMemberships/empNumber/7"]
${mem_name}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'][normalize-space()='-- Select --'])[1]
${acca}    xpath=//span[text()='ACCA']
${currency}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'][normalize-space()='-- Select --'])[1]
${curr}    xpath=//span[text()='Algerian Dinar']
${amount}    xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${subscription}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'][normalize-space()='-- Select --'])[1]
${subs}    xpath=//span[text()='Company']
${com_date}    xpath=(//div[@class='oxd-date-input']//input)[1]
${ren_date}    xpath=(//div[@class='oxd-date-input']//input)[2]

*** Keywords ***
Click the Membership
    Wait Until Element Is Visible    ${membership}
    Click Element    ${membership}

Select the appropriate Membership
    Click Element    ${mem_name}
    Wait Until Element Is Visible    ${acca}   10s
    Wait Until Element Is Enabled    ${acca}    10s
    Click Element    ${acca}

Enter the valid amount
    [Arguments]    ${job_text}
    Wait Until Element Is Visible    ${amount}
    Input Text    ${amount}    ${job_text}

Select the appropriate Subscription
    Click Element    ${subscription}
    Wait Until Element Is Visible    ${subs}   10s
    Wait Until Element Is Enabled    ${subs}    10s
    Click Element    ${subs}

Select the appropriate Currency
    Click Element    ${currency}
    Wait Until Element Is Visible    ${curr}   10s
    Wait Until Element Is Enabled    ${curr}    10s
    Click Element    ${curr}

Select the appropriate Commence Date    
    [Arguments]  ${commence_date}
    Wait Until Element Is Visible    ${com_date}
    Input Text    ${com_date}    ${commence_date}

Select the appropriate Renewal Date    
    [Arguments]  ${renewal_date}
    Wait Until Element Is Visible    ${ren_date}
    Input Text    ${ren_date}    ${renewal_date}
