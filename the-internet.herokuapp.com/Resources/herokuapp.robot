*** Settings ***
Documentation  Main testing file
Library  SeleniumLibrary
Resource  ../Data/variables.robot
Resource  ../Resources/PageObjects/add-remove-elements-page.robot


*** Keywords ***
the user loads the add-remove elements page
    add-remove-elements-page.load

the user clicks the add element button
    add-remove-elements-page.click add element

an element should appear
    add-remove-elements-page.verify element appears

the user clicks the delete button
    add-remove-elements-page.click delete button

the element should be deleted
    add-remove-elements-page.verify the button is deleted

the user clicks the add element button multiple times
    add-remove-elements-page.click multiple add element  ${MULTIPLE_ELEMENTS}

multiple elements should appear
    add-remove-elements-page.verify multiple elements appear  ${MULTIPLE_ELEMENTS}

the user clicks all delete buttons
    add-remove-elements-page.click all delete buttons  ${MULTIPLE_ELEMENTS}

all elements should be deleted
    add-remove-elements-page.verify all buttons were deleted  ${MULTIPLE_ELEMENTS}




