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

  Scenario: Viewing All Product Details
    Given I am on the Product Details Page for "Bamboo Toothbrush"
    Then I see the product name, price, description, high-resolution image, stock availability, and average user rating

  Scenario: Changing Quantity Before Adding to Cart
    Given I am on the Product Details Page
    When I select quantity "3" from the quantity dropdown
    And I click "Add to Cart"
    Then the cart icon updates by 3 items
    And a notification confirms 3 items were added to the cart

  