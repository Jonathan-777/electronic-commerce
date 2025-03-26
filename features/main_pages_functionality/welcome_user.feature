Feature: Product Page Interactions

  As a visitor 
  I want to browse featured products, categories, and search for items
  So that I can quickly find what I want

  Scenario: Browsing Featured Products
    Given I am on the landing page
    When I click on a product
    Then I remain on the same page while a quick preview modal appears
    And I see the product image, price, details, and an “Add to Cart” button



