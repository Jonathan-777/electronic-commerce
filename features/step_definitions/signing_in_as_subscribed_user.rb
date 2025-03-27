require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new profile-user' do
    let!(:user) { User.create(first_name: 'Jhon', last_name: 'Doe', email: 'jhon.doe@test.com', password: 'SuperPassword') }
    before(:each) do
      visit new_user_path(user)
    end
    scenario 'should be successful' do
      within('form') do
       fill_in 'Email', with: "first.user@email.com"
       fill_in 'Password', with: "superPassword"
       fill_in 'First name', with: "jhon"
       fill_in 'Last name', with: "doe"
      end
      click_button 'Create User'
      expect(page).to have_content('User was successfully created')
    end
    scenario 'should fail' do
      User.create!(email: "first.user@email.com", password: "whatever", first_name: "Existing", last_name: "User")
      visit new_user_path
      within('form') do
        fill_in 'Email', with: "first.user@email.com"
        fill_in 'Password', with: "superPassword"
        fill_in 'First name', with: "jhon"
        fill_in 'Last name', with: "doe"
      end
      click_button 'Create User'
      expect(page).to have_content('Email has already been taken')
    end
  end
end
