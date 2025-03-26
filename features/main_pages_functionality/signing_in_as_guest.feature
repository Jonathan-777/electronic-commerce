Feature: creating a guest  account in landing page

    As a visitor
    I want to create a guest account
    So that I can move on to the welcome page

    Scenario: filling out the required guest form
        Given I am on the landing page
        When fill out first name
        And I fill out last name
        And I click the guest checkbox
        Then I am taken to welcome page