Feature: Product Page Interactions

  As a visitor 
  I want to browse featured products, categories, and search for items
  So that I can quickly find what I want

  Scenario: Browsing Featured Products
    Given I am on the home page
    When I click on a product
    Then I am redirected to the product details page
    And I see the product image, price, details, and an "Add to Cart" button

  Scenario: I click on the "Sign In" link from the navbar
    Given I am on the home page
    When I click on the "Sign In" link in the navbar
    Then I should be on the login page
