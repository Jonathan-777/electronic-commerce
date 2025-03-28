require 'rails_helper'

RSpec.feature "Product Details", type: :feature do
  let!(:product) { create(:product) }

  scenario "Visitor views product details and adds it to the cart" do
    visit product_path(product)

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content("$#{product.price}")

    click_button "Add to Cart"

    expect(page).to have_content("#{product.name} added to cart")
  end
end
