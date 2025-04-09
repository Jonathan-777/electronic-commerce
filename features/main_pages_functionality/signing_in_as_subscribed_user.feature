Feature: I am on the landing page

    As a visitor
    I want to browse products
    So that I can decide what to buy

    Scenario: I want to create a new account as non-guest
        Given I am on the landing page
        When I click on the typebox fields
        And I fill all the typebox fields out
        And I have guest checkbox empty
        Then I am allowed to create my new account
