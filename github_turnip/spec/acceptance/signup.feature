Feature: Sign Up
  As a user
  I want to sign up to the system
  So I can login with a new account

  Scenario: User can open signup page via menu
    Given home page of web app
    When I click on SignIn menu item
    Then I should be redirected to join page

  Scenario: User can sign in with correct data
    Given join in page of web app
    When I fill and submit form on join in page with correct data
    And I confirm action on plan page
    Then I should be logged and redirected to home page

  Scenario: User can not sign in with blank data
    Given join in page of web app
    When I fill and submit form on join in page with blank data
    Then I should see info on join page that data can not be blank

  Scenario: User can not sign up with incorrect email
    Given join in page of web app
    When I fill and submit form on join in page with incorrect email
    Then I should see info on join page that email is incorrect

  Scenario: User can not sign up with duplicated data
    Given join page of web app
    When I fill and submit form on join page with correct data
    And I confirm action on plan page
    And I fill and submit form with the same data
    Then I should see info on join page that email and login are already taken