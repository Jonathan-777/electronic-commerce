Feature: Checkout & Payment Page

  As a visitor (non-account user)
  I want to enter my shipping and payment details
  So that I can place an order without signing up

  Scenario: Guest Checkout Process
    Given I have items in my cart
    When I proceed to checkout as a guest
    Then I am asked to enter my shipping address and payment details
    And I can complete my purchase without creating an account
