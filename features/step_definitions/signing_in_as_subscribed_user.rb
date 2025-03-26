require 'rails_helper'
RSpec.feature "Users", type: :feature do
  context 'create new profile-user' do
    scenario 'should be successful' do
      visit new_user_path
      fill_in 'Email', with: "first.user@email.com"
      fill_in 'Password', with: "superPassword"
      fill_in 'First name', with: "jhon"
      fill_in 'Last name', with: "doe"
      click_button 'Create User'
      expect(page).to have_content('User was successfully created')
    end
  end
end
