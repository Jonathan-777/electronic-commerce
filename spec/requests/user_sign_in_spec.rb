require 'rails_helper'

RSpec.describe 'User login', type: :request do
  before do
    @user = User.create!(
      email: 'hardcoded@example.com',
      password: 'hardpass777',
      password_confirmation: 'hardpass777',
      guest: false
    )

    login_as(@user, scope: :user) 
  end

  it 'redirects to home and sees Log Out on next page' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response.body).to include('Log Out')
  end
end
