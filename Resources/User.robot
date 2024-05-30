*** Settings ***
Documentation   The Resource contains the elements of the User Feature of the Admin Page 
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${users}    xpath=//ul[@class='oxd-dropdown-menu']//a
${username}    xpath=(//div[@class='oxd-grid-item oxd-grid-item--gutters']//input)[1]
${user_role}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'][normalize-space()='-- Select --'])[1]
${ess}    xpath=//span[text()='ESS']
${employee_name}    xpath=//input[@placeholder="Type for hints..."]
${status}    xpath=(//div[@class='oxd-select-text oxd-select-text--active']//div)[3]
${enabled}    xpath=//span[text()='Enabled']
${search_button}    xpath=//button[text()=' Search '] 
${name}    xpath=//span[text()='FName Mname LName']
#${result}=    Get Text    xpath=//div//span[text()='(1) Record Found']
${admin_role}    xpath=//span[text()='Admin']

*** Keywords ***

Click the user management
    Wait Until Element Is Visible    ${user_management}
    Click Element    ${user_management}

Click the users
    Wait Until Element Is Visible    ${users}
    Click Element    ${users}
    
Enter the username
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${username}    
    Input Text    ${username}  ${user}

Select the ESS user role
    Wait Until Element Is Visible    ${user_role}
    Click Element    ${user_role}
    Wait Until Element Is Visible    ${user_role}   10s
    Wait Until Element Is Enabled    ${user_role}    10s
    Click Element    ${ess}  

Select the Admin user role
    Wait Until Element Is Visible    ${user_role}
    Click Element    ${user_role}
    Wait Until Element Is Visible    ${user_role}   10s
    Wait Until Element Is Enabled    ${user_role}    10s
    Click Element    ${admin_role}

#Enter employee name
    #[Arguments]    ${empname}
    #Log To Console    Inputting employee name: ${empname}
    #Wait Until Element Is Visible    ${employee_name}
    #Input Text    ${employee_name}    ${empname}
    #Log To Console    Employee name input: ${empname}
    #Sleep    1s
    #Press Key    ${employee_name}    ARROW_DOWN
    #Log To Console    Pressed ARROW_DOWN key
    #Sleep    1s
    #Press Key    ${employee_name}    ENTER
    #Log To Console    Pressed ENTER key
    #Sleep    5s  # Adjust sleep time based on your application response time
    #Log To Console    Completed employee name input process

Select the Status  
    Click Element    ${status}
    Wait Until Element Is Visible    ${enabled}   10s
    Wait Until Element Is Enabled    ${enabled}    10s
    Click Element    ${enabled}

Click the search button
    Wait Until Element Is Visible    ${search_button}
    Click Button    ${search_button}

Verify the Valid Search
    Wait Until Element Is Visible    (//div[@class='oxd-table-header']//div)[4]
    Element Text Should Be    (//div[@class='oxd-table-header']//div)[4]    Username

Verify the Invalid Search
    Wait Until Element Is Visible    (//div[@class='oxd-table-header']//div)[4]
    Element Text Should Be    (//div[@class='oxd-table-header']//div)[4]    Username



