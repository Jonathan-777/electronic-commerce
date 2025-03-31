Feature: Checkout & Payment Page

  As a visitor (non-account user)
  I want to enter my shipping and payment details
  So that I can place an order without signing up

  Scenario: Guest Checkout Process
    Given I have items in my cart
    When I proceed to checkout as a guest
    Then I am asked to enter my shipping address and payment details
    And I can complete my purchase without creating an account

  Scenario: non-guest checkout requires login
    Given the user is not logged in as guest/user
    When they try to check out
    Then they are asked to log in

  Scenario: Successful checkout with valid payment
    Given the user has items in the cart
    When they enter valid payment information
    Then the order is placed successfully

  Scenario: Checkout requires login
    Given the user is not logged in
    When they try to check out
    Then they are asked to log in

  Scenario: User is prompted to enter missing information before checkout
    Given the user is logged in
    And the user has items in their shopping cart
    And the user's profile is missing shipping address, phone number, or age
    When the user proceeds to checkout
    Then they are prompted to complete their profile
    And the checkout process is paused until all required information is filled in