require 'rails_helper'

RSpec.describe User, type: :model do
  include FactoryBot::Syntax::Methods
  context 'check the creation of user_data variables from User' do
    it 'check association and creation of variable bio in User data' do
        user1 = create(:user)
        create(:user_data, user: user1, bio: "I love testing!")
        # Reload to ensure association is fetched from DB
        expect(user1.reload.user_data.bio).to eq("I love testing!")
    end
    it 'association and creation variable phone_number' do
      user =create(:user)
      create(:user_data, user:, phone_number: "234-231-1312")
      expect(user.reload.user_data.phone_number).to eq("234-231-1312")
    end
    it 'association and creation of variable date_of_birth' do
      dob = Date.new(1999, 5, 10)
      user_data = create(:user_data, date_of_birth: dob)
      expect(user_data.date_of_birth).to eq(dob)
    end
    it 'stores and retrieves the correct address' do
      address = "456 Ruby Lane, Railsville"
      user_data = create(:user_data, address: address)
      expect(user_data.address).to eq(address)
    end
    it 'stores and retrieves the correct recovery_email' do
      recovery_email = "backup@example.com"
      user_data = create(:user_data, recovery_email: recovery_email)
      expect(user_data.recovery_email).to eq(recovery_email)
    end
  end
end
