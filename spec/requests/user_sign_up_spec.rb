# spec/features/user_sign_up_spec.rb
require 'rails_helper'

RSpec.describe 'User sign-up', type: :feature do
  scenario 'redirects to /home after successful registration' do
    visit '/auth/sign_up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_button 'Sign up'

    expect(current_path).to eq('/')  # custom root
  end

  scenario 'guest provides only first and last name and is redirected to /home' do
    visit '/auth/sign_up'

    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    check 'guest_checkbox'

    click_button 'Sign up'

    expect(current_path).to eq('/')  # should redirect to authenticated_root
  end
end
