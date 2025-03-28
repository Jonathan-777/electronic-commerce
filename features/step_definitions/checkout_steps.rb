
Given("I have items in my cart") do
  @product = create(:product)
  visit product_path(@product)
  click_button "Add to Cart"
end

When("I proceed to checkout as a guest") do
  visit cart_path
  check 'Checkout as Guest' # Checkbox for guest checkout
  click_button "Proceed to Checkout"
end

Then("I am asked to enter my first name, last name, shipping address, and payment details") do
  expect(page).to have_content("First name")
  expect(page).to have_content("Last name")
  expect(page).to have_content("Shipping Address")
  expect(page).to have_content("Payment Details")
end

And("I can complete my purchase without creating an account") do
  fill_in "First name", with: "John"
  fill_in "Last name", with: "Doe"
  fill_in "Address", with: "123 Street, City"
  fill_in "Credit card number", with: "4242424242424242"
  fill_in "Expiration date", with: "12/28"
  fill_in "Cvv", with: "123"
  click_button "Place Order"

  expect(page).to have_content("Thank you for your purchase!")

  # Validate the order was created for a guest
  order = Order.order(created_at: :desc).first
  expect(order.user).to be_nil # Ensures the order is guest-based
  expect(order.first_name).to eq("John")
  expect(order.last_name).to eq("Doe")
end
