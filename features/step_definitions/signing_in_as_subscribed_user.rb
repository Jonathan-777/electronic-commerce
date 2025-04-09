Given('I am on the landing page') do
  visit '/' # or your landing path
end

When('I click on the typebox fields') do
  find_field('First name').click
  find_field('Last name').click
  find_field('Email').click
  find_field('Password').click
end

When('I fill all the typebox fields out') do
  fill_in 'First name', with: 'Jonathan'
  fill_in 'Last name', with: 'Reyes'
  fill_in 'Email', with: 'jonathan@example.com'
  fill_in 'Password', with: 'securepass123'
end

When('I have guest checkbox empty') do
  uncheck 'guest_checkbox'
end

Then('I am allowed to create my new account') do
  click_button 'Sign up'
  expect(current_path).to eq('/') # or authenticated_root_path
  expect(page).to have_content('Log Out') # or some post-login confirmation
end