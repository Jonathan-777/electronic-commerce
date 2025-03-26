Feature: Product Details Page

  As a visitor 
  I want to view detailed product information
  So that I can decide whether to add it to my cart

  Scenario: Adding a Product to Cart Without Leaving the Page
    Given I am on the Product Details Page
    When I click the "Add to Cart" button
    Then the cart icon updates to reflect the new item count
    And a small notification appears confirming the item has been added
    And I remain on the product page
