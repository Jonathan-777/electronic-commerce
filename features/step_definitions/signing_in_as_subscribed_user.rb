require 'capybara/cucumber'


Given('I am on the landing page') do
  visit 'auth/sign_up'
end

When('I fill in the signup form') do
  
  fill_in 'Email', with: 'jonathan@example.com'
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  fill_in 'First name', with: 'Jonathan'
  fill_in 'Last name', with: 'Reyes'

end


When('I have guest checkbox empty') do
  uncheck 'guest_checkbox'
end

Then('I am allowed to create my new account') do
  click_button 'Sign up'
  expect(current_path).to eq('/')
  expect(page).to have_content('Log Out') #
end