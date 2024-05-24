*** Settings ***
Documentation    Verify the User Management feature of the Admin
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close the Browser
Library    DataDriver    file=../TestData/JobDetails.xlsx    sheet_name=Sheet1
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/User.robot
Resource    ../Resources/Job.robot
Test Template    Add a new job

*** Test Cases ***
Add the new job    ${Condition}    ${Job_title}    ${Job_des}    ${Job_note}

*** Keywords ***
Add a new job
    [Arguments]    ${Condition}    ${Job_title}    ${Job_des}    ${Job_note}
    Click the Admin button
    Click the Job 
    Click the Job Titles
    Click the Add Button
    IF    '${Condition}'=='Valid'
        Enter the Job Title    ${Job_title}
        Enter the Job Description    ${Job_des}
        Enter the Job Note    ${Job_note}
        Click the Save button
        Verify the job is added
    ELSE IF    '${Condition}'=='Cancel'
        Enter the Job Title    ${Job_title}
        Enter the Job Description    ${Job_des}
        Enter the Job Note    ${Job_note}
        Click the Cancel button
        Verify the previous page
    ELSE IF    '${Condition}'=='Partial'
        Enter the Job Title    ${Job_title}
        Click the Save button
        Verify the job is added
    END

    