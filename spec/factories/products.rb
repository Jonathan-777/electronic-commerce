FactoryBot.define do
  factory :product do
    name { "Sample Product" }
    description { "A detailed description of the product." }
    price { 19.99 }
    stock { 100 }
  end
end
