*** Settings ***
Documentation  Page object file for the add-remove elements page
Library  SeleniumLibrary
Resource  ../../Data/variables.robot

*** Variables ***
${ADD_ELEMENT_BUTTON}  xpath=//*[@id="content"]/div/button
${DELETE_ELEMENT_BUTTON}  //*[@id="elements"]/button


*** Keywords ***
load
    go to  ${START_URL}/${ADD-REMOVE-ELEMENTS_PAGE}/

click add element
    click element  ${ADD_ELEMENT_BUTTON}

verify element appears
    wait until page contains element  ${DELETE_ELEMENT_BUTTON}

click delete button
    click element  ${DELETE_ELEMENT_BUTTON}

verify the button is deleted
    wait until page does not contain element  ${DELETE_ELEMENT_BUTTON}

click multiple add element
    [Arguments]  ${num_elements}
    ${limit}  convert to integer  ${num_elements}
    ${limit}  evaluate  ${limit} + 1
    :FOR  ${index}  IN RANGE  1  ${limit}
    \  click element  ${ADD_ELEMENT_BUTTON}

verify multiple elements appear
    [Arguments]  ${num_elements}
    ${limit}  convert to integer  ${num_elements}
    ${limit}  evaluate  ${limit} + 1
    :FOR  ${index}  IN RANGE  1  ${limit}
    \  ${current_button}  catenate  SEPARATOR=  ${DELETE_ELEMENT_BUTTON}  [  ${index}  ]
    \  wait until page contains element  ${current_button}
    click element  ${DELETE_ELEMENT_BUTTON}

click all delete buttons
    [Arguments]  ${num_elements}
    ${limit}  convert to integer  ${num_elements}
    ${limit}  evaluate  ${limit} + 1
    :FOR  ${index}  IN RANGE  1  ${limit}
    \  ${new_index}  evaluate  ${num_elements} + 1
    \  ${new_index}  evaluate  ${new_index} - ${index}
    \  ${current_button}  catenate  SEPARATOR=  ${DELETE_ELEMENT_BUTTON}  [  ${new_index}  ]
    \  click element  ${current_button}

verify all buttons were deleted
    [Arguments]  ${num_elements}
    ${limit}  convert to integer  ${num_elements}
    ${limit}  evaluate  ${limit} + 1
    :FOR  ${index}  IN RANGE  1  ${limit}
    \  ${new_index}  evaluate  ${num_elements} + 1
    \  ${new_index}  evaluate  ${new_index} - ${index}
    \  ${current_button}  catenate  SEPARATOR=  ${DELETE_ELEMENT_BUTTON}  [  ${new_index}  ]
    \  wait until page does not contain element  ${current_button}
    wait until page does not contain element  ${DELETE_ELEMENT_BUTTON}
