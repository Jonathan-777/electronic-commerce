# spec/requests/admin/dashboard_spec.rb
require 'rails_helper'

RSpec.describe 'Admin::Dashboard', type: :request do
  describe 'GET /admin/dashboard' do
    context 'when not signed in' do
      it 'redirects to admin login page' do
        get '/admin/dashboard'
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

    context 'when signed in as admin' do
      let(:admin) { Admin.create!(email: 'admin@example.com', password: 'password') }

      before do
        sign_in admin
      end

      it 'returns http success' do
        get '/admin/dashboard'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
