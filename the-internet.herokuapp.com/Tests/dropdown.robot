*** Settings ***
Documentation  Test Suite for the dropdown page at the-internet.herokuapp.com
Resource  ../Resources/herokuapp.robot
Resource  ../Resources/common.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***

*** Test Cases ***
Drop down list box should contain default text
    [Tags]  Smoke
    Given the user loads the drop down list page
    When the drop down page loads
    Then the drop down list contains default text

Drop down list box should contain correct options
    [Tags]  Smoke
    Given the user loads the drop down list page
    When the drop down page loads
    Then the drop down list contains the correct options

The user should be able to select an option from the drop down list using mouse
    [Tags]  Regression
    Given the user loads the drop down list page
    And the drop down page loads
    When the user selects the first list option using the mouse
    Then the first option is selected

The user should be able to select an option from the drop down list using keyboard
    [Tags]  Regression
    Given the user loads the drop down list page
    And the drop down page loads
    When the user selects the second list option using the keyboard
    Then the second option is selected

The user should be able to change the selection from the drop down list box
    [Tags]  Regression
    Given the user loads the drop down list page
    And the drop down page loads
    And the user selects the first list option using the mouse
    And verify first option selected
    When the user selects the second list option using the keyboard
    Then the second option is selected

