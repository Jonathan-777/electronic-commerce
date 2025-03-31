Feature: Admin Dashboard

  As an admin
  I want to manage product listings
  So that I can add, update, or remove products from the catalog

  Scenario: Adding a New Product
    Given I am logged into the Admin Dashboard
    When I click "Manage Products" and select "Add New Product"
    Then I see a form to enter product details (name, price, images, description, stock availability)
    And clicking "Save" adds the product to the store and updates the Product Browsing Page dynamically

  Scenario: Editing an Existing Product
    Given I am logged into the Admin Dashboard
    And a product named "Eco Bottle" exists in the catalog
    When I click "Manage Products" and choose "Edit" for the "Eco Bottle"
    Then I see a pre-filled form with the product's current details
    When I update the price to "$19.99" and click "Save"
    Then the updated product is visible on the Product Browsing Page with the new price

  Scenario: Deleting a Product
    Given I am logged into the Admin Dashboard
    And a product named "Plastic Straw" exists in the catalog
    When I click "Manage Products" and select "Delete" for the "Plastic Straw"
    And I confirm the deletion
    Then the product is removed from the catalog
    And it no longer appears on the Product Browsing Page

  

