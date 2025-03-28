Feature: Checkout & Payment Page

  As a visitor (non-account user)
  I want to checkout without creating an account
  So that I can quickly purchase items as a guest

  Scenario: Guest Checkout Process
    Given I have items in my cart
    When I proceed to checkout as a guest
    Then I am asked to enter my first name, last name, shipping address, and payment details
    And I can complete my purchase without creating an account
