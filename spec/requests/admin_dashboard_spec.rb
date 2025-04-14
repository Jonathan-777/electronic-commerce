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
  end
end
