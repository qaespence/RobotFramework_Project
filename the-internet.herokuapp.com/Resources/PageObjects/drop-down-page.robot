*** Settings ***
Documentation  Page object file for the drop down list page
Library  SeleniumLibrary
Resource  ../../Data/variables.robot

*** Variables ***
${DROP-DOWN-LIST-BOX}  xpath=//*[@id="dropdown"]
${OPTION-1}  xpath=//*[@id="dropdown"]/option[2]
${OPTION-2}  xpath=//*[@id="dropdown"]/option[3]

*** Keywords ***
load
    go to  ${START_URL}/${DROP-DOWN_PAGE}

verify page loaded
    wait until element is visible  ${DROP-DOWN-LIST-BOX}

verify default option
    ${get_text}  get selected list label  ${DROP-DOWN-LIST-BOX}
    should be equal as strings  ${get_text}  Please select an option

verify all options are present
    select from list by value  ${DROP-DOWN-LIST-BOX}  1
    ${get_text}  get selected list label  ${DROP-DOWN-LIST-BOX}
    should be equal as strings  ${get_text}  Option 1
    select from list by value  ${DROP-DOWN-LIST-BOX}  2
    ${get_text}  get selected list label  ${DROP-DOWN-LIST-BOX}
    should be equal as strings  ${get_text}  Option 2

mouse click first option
    click element  ${DROP-DOWN-LIST-BOX}
    click element  ${OPTION-1}
    click element  ${OPTION-1}

verify first option selected
    ${get_text}  get element attribute  ${OPTION-1}  selected
    should be equal as strings  ${get_text}  true

keyboard select second option
    set focus to element  ${DROP-DOWN-LIST-BOX}
    press key  ${DROP-DOWN-LIST-BOX}  \ue015
    press key  ${DROP-DOWN-LIST-BOX}  \ue015
    press key  ${DROP-DOWN-LIST-BOX}  \ue007

verify second option selected
    ${get_text}  get element attribute  ${OPTION-2}  selected
    should be equal as strings  ${get_text}  true


