require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new guest' do
    scenario 'should be successful' do
      visit new_user_path
      check 'click to create guest experience'
      fill_in 'First name', with: 'jhon'
      fill_in 'Last name', with: 'doe'
      click_button 'Create User'
      expect(page).to have_content('User was successfully created')
    end
    scenario "Guest user is created with email and password, which are cleared after creation" do
      visit new_user_path
  
      # Fill out form with guest user details including email/password
      check 'click to create guest experience' # adjust if it's a checkbox
      fill_in 'First name', with: 'dee'
      fill_in 'Last name', with: 'reynolds'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password123'
  
      click_button 'Create User'
  
      expect(page).to have_content('User was successfully created.')
      expect(page).to have_content('Guest: true')
      expect(page).to have_content('First name: dee')
      expect(page).to have_content('Last name: reynolds')
  
      # Now confirm email and password were blanked/stored as nil
      user = User.order(created_at: :desc).first
  
      expect(user.guest).to be true
      expect(user.email).to be_nil.or be_blank
      expect(user.password_digest).to be_nil.or be_blank
    end
  end
end
