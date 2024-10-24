*** Settings ***
Library     SeleniumLibrary
Resource    ../Repositories/test_repositories.robot
Resource   ../variables/test_variables.robot

*** Test Cases ***

Verify User able to search book in homepage
    [Documentation]     verify user able to search book -- note that on the website there's no response after clicked
    When Open Browser to Bookstore
    Then Verify Search Book
    Close Browser


Verify User not able to search book in homepage
    [Documentation]     verify user not able to search book -- note that on the website there's no response after clicked
    When Open Browser to Bookstore
    Then Verify Search Book with wrong title
    Close Browser

Verify Login Logout page
    [Documentation]     Verify user able to login
    When Open Browser to Bookstore
    Then Verify User able to login
    Then Verify User able to logout
    Close Browser

Verify User able to search book after login page
    [Documentation]     verify user able to search book after login page-- note that on the website there's no response after clicked
    When Open Browser to Bookstore
    Then Verify User able to login
    Then Verify Search Book after login
    Then Verify User able to logout
    Close Browser

Verify User not able to search book after login page
    [Documentation]     verify user not able to search book after login page-- note that on the website there's no response after clicked
    When Open Browser to Bookstore
    Then Verify User able to login
    Then Verify Search Book with wrong title
    Then Verify User able to logout
    Close Browser