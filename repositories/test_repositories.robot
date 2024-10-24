*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource   ../variables/test_variables.robot

*** Keywords ***

Open Browser to Bookstore
    [Documentation]     Open the browser and navigate to bookstore homepage
    Open Browser        ${URL}      ${BROWSER}

Verify Search Book
    [Documentation]     Verify user able to search book
    Wait Until Page Contains Element    ${SEARCH_FIELD}     10s
    Input Text    ${SEARCH_FIELD}    Richard E. Silverman
    Page Should Contain    Richard E. Silverman
    Wait Until Element Is Visible    ${CLICK_ITEM_SEARCH}       10s
    Click Element    ${CLICK_ITEM_SEARCH}

Verify Search Book with wrong title
    [Documentation]     Verify not able to shown book
    Wait Until Page Contains Element    ${SEARCH_FIELD}     10s
    Input Text    ${SEARCH_FIELD}    nonExistenBook
    Sleep    2s     #give time to search complete
    Page Should Contain Element    xpath://div[@class='rt-noData' and text()='No rows found']

Verify User able to login
    [Documentation]        Verify user able to login
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${USERNAME_FIELD}
    Input Text    ${USERNAME_FIELD}     ${USERNAME}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}     ${PASSWORD}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}

Verify Search Book after login
    [Documentation]     Verify user able to search book
    Wait Until Page Contains Element    ${SEARCH_FIELD}     10s
    Input Text    ${SEARCH_FIELD}    Addy Osmani
    Page Should Contain    Addy Osmani
    Wait Until Element Is Visible    ${CLICK_ITEM_SEARCH_2}       10s
    Click Element    ${CLICK_ITEM_SEARCH_2}

Verify User able to logout
    [Documentation]     verify user able to do logout
    Wait Until Page Contains Element    ${LOGOUT_BUTTON}
    Click Element    ${LOGOUT_BUTTON}
