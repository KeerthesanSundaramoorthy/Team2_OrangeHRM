*** Settings ***
Documentation    Test for QuickLaunch on dashboard
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/RecruitmentResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/QuickLaunchResources.robot


*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***

Assign_leave 
    [Tags]    Regression
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    QuickLaunchResources.Click on Dashboard
    QuickLaunchResources.Click on Assign Leave Button
    #Wait Until Element Is Visible    10s
    QuickLaunchResources.Check it navigates to assign leave page

Leave_List
    [Tags]    Regression
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    QuickLaunchResources.Click on Leave List Button
    QuickLaunchResources.check it navigates to leave page

TimeSheets
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    QuickLaunchResources.Click on Leave List Button
    QuickLaunchResources.check it navigates to leave page

Apply_Leave
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    QuickLaunchResources.click on apply leave button
    QuickLaunchResources.check it navigates to apply leave

My_Leave
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    QuickLaunchResources.click on apply my leave button
    QuickLaunchResources.check it navigates to my leave
    
