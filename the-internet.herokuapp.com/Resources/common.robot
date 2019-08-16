*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close browser
