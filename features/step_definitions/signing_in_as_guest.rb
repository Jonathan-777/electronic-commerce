require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new guest' do
    scenario 'should be successful' do
      visit new_user_path
      fill_in 'First name', with: 'jhon'
      fill_in 'Last name', with: 'doe'
      click_button 'Create User'
      expect(page).to have_content('User was successfully created')
    end
  end
end
