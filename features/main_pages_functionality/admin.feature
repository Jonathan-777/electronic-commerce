Feature: Admin Dashboard

  As an admin
  I want to manage product listings
  So that I can add, update, or remove products from the catalog

  Scenario: Adding a New Product
    Given I am logged into the Admin Dashboard
    When I click "Manage Products" and select "Add New Product"
    Then I see a form to enter product details (name, price, images, description, stock availability)
    And clicking "Save" adds the product to the store and updates the Product Browsing Page dynamically
