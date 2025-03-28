class Order < ApplicationRecord
  belongs_to :user, optional: true # for guest orders
end
