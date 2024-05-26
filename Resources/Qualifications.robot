*** Settings ***
Documentation   The Resource contains the elements of the Qualification Page on the My Info
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot

*** Variables ***
${my_info}    css=a[class='oxd-main-menu-item active']
${qualifications}    xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${company_name}    xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${job_title}    xpath=(//input[@class='oxd-input oxd-input--active'])[3]
${from_date}    xpath=(//input[@placeholder='yyyy-dd-mm'])[1]
${to_date}    xpath=(//input[@placeholder='yyyy-dd-mm'])[2]
${comment}    xpath=//div[@data-v-957b4417]//textarea
${add_but}    xpath=(//button[@type="button"][@class="oxd-button oxd-button--medium oxd-button--text"])[1]

*** Keywords ***
Click the My Info

Click the Qualifications

Click the Add Button

Enter the Company Name

Enter the Job Title

    Enter the From Date
    Enter the To Date
    Enter the Comment