*** Settings ***
Documentation    Resource file with reusable keywords and variables
Library    SeleniumLibrary


*** Variables ***
${browser_name}    Chrome
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${admin}    css:a[href="/web/index.php/admin/viewAdminModule"]
#${admin}    document.querySelector("a[href='/web/index.php/admin/viewAdminModule']")
${user_management}    xpath=(//div[@class='oxd-topbar-body']//span)[1]
${save_button}    xpath=(//p[@class='oxd-text oxd-text--p orangehrm-form-hint']//following-sibling::button)[2]
${add_button}    xpath=//button[@type="button"][@class="oxd-button oxd-button--medium oxd-button--secondary"]
${success_saved}    xpath=(//div[@class='oxd-toast-start']//p)[2]


*** Keywords ***    
#To open the browser with url
Open the browser with url
     Create Webdriver   ${browser_name}
     Go to       ${url}
     Maximize Browser Window
     Set Selenium Implicit Wait     5

#To close the browser
Close Browser Session
      Close Browser

Click the Admin button
    Click Element    ${admin}

Click the Save button    
    Wait Until Element Is Enabled    ${save_button}
    Click Button    ${save_button}

Click the Add Button
    Wait Until Element Is Visible    ${add_button}    
    Click Button    ${add_button}

Verify the success message is displayed
    Wait Until Element Is Visible    ${success_saved}    10s
    Element Text Should Be    ${success_saved}    Successfully Saved

