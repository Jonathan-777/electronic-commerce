Feature: I am on the landing page

    As a visitor
    I want to browse products
    So that I can decide what to buy

    Scenario: I want to create a new account as non-guest
        Given I am on the landing page
        When I fill in the signup form
        And I have guest checkbox empty
        Then I am allowed to create my new account

    Scenario: Navigation From Home page to sign in
        Given I am on the home page
        When I click on the "Sign In" link in the navbar
        Then I should be on the login page