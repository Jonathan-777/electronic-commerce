# spec/factories/user_data.rb
FactoryBot.define do
  factory :user_data do
    bio { "I am a test bio." }
    phone_number { "1234567890" }
    date_of_birth { "1990-01-01" }
    address { "123 Main St" }
    recovery_email { Faker::Internet.email }
    ready_for_data_entry { true }
    association :user
  end
end