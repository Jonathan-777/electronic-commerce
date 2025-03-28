require 'rails_helper'

RSpec.feature "Guest Checkout", type: :feature do
  let!(:product) { create(:product) }

  scenario "Guest user completes checkout successfully" do
    visit product_path(product)
    click_button "Add to Cart"

    visit cart_path
    check 'Checkout as Guest'
    click_button "Proceed to Checkout"

    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Shipping Address")
    expect(page).to have_content("Payment Details")

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Address", with: "123 Street, City"
    fill_in "Credit card number", with: "4242424242424242"
    fill_in "Expiration date", with: "12/28"
    fill_in "Cvv", with: "123"
    click_button "Place Order"

    expect(page).to have_content("Thank you for your purchase!")

    order = Order.order(created_at: :desc).first
    expect(order.user).to be_nil # Ensuring guest order
    expect(order.first_name).to eq("John")
    expect(order.last_name).to eq("Doe")
  end
end
