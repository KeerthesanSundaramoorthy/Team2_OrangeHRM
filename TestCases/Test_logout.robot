*** Settings ***
Documentation        test valid logout page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ChangePasswordResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Variables ***
${username}    Admin   
${password}    admin123
${should_fail}    False

*** Test Cases ***
# To validate successful change password
validate successful change password
    [Tags]    Retest
    [Documentation]   Intentionally fail and then pass on rerun.
    Run Keyword If    ${should_fail}    Fail    Intentional fail.
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click logout

*** Keywords ***
# Simulate Failure Keyword
Simulate Failure
    Fail    Intentional fail.