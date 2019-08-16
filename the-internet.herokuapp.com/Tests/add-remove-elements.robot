*** Settings ***
Documentation  Test Suite for the add-remove elements page at the-internet.herokuapp.com
Resource  ../Resources/herokuapp.robot
Resource  ../Resources/common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***

*** Test Cases ***
Should be able to add an element
    [Tags]  Smoke
    Given the user loads the add-remove elements page
    When the user clicks the add element button
    Then an element should appear

Should be able to add then remove an element
    [Tags]  Smoke
    Given the user loads the add-remove elements page
    And the user clicks the add element button
    When the user clicks the delete button
    Then the element should be deleted

Should be able to add multiple elements
    [Tags]  Regression
    Given the user loads the add-remove elements page
    When the user clicks the add element button multiple times
    Then multiple elements should appear

Should be able to add and remove multiple elements
    [Tags]  Regression
    Given the user loads the add-remove elements page
    And the user clicks the add element button multiple times
    When the user clicks all delete buttons
    Then all elements should be deleted
