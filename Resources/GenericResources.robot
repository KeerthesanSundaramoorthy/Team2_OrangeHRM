#generic resources
*** Settings ***
Documentation    Resource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${browser}    Chrome
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${admin}    css:a[href="/web/index.php/admin/viewAdminModule"]
${user_management}    xpath=//span[text()='User Management ']

*** Keywords ***
Open the Browser with URL
    Create Webdriver    Chrome
    #Open Browser    ${url}    
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close the Browser
    Close Browser