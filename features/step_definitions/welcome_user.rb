Given("I am on the home page") do
  visit "/home"
end

When("I click on the {string} link in the navbar") do |link_text|
  within("nav") do
    click_link link_text
  end
end

Then("I should be on the login page") do
  expect(page).to have_current_path("/auth/sign_in")
end
