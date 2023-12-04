Feature: All Login scenarios to saucedemo.com

@positive
#Positive Case
  Scenario Outline: Successful login with accepted username & valid password
    Given user on the saucedemo login page
    When user input username "<username>" and password "<password>"
    And user click the login button
    Then user should be on the products page

  Examples:
  | username                | password     |
  | standard_user           | secret_sauce |
  | problem_user            | secret_sauce |
  | performance_glitch_user | secret_sauce |
  | error_user              | secret_sauce |
  | visual_user             | secret_sauce |

@negative
#Negative Case
  Scenario: Failed login with locked out user (accepted user) & valid password
    Given user on the saucedemo login page
    When user input username "locked_out_user" and password "secret_sauce"
    And user click the login button
    Then user should see an error message for locked out user

  Scenario Outline: Failed login with wrong username & wrong password
    Given user on the saucedemo login page
    When user input username "<username>" and password "<password>"
    And user click the login button
    Then user should see an error message credentials doesn't match

  Examples:
  | username      | password     |
  #valid username, wrong password
  | standard_user | 1234         |
  #wrong username, valid password
  | voldemort     | secret_sauce |
  #wrong username, wrong password
  | xxxxxx        | 00000        |