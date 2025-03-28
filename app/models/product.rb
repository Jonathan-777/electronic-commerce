class Product < ApplicationRecord
  has_one_attached :image  # Adds image attachment support
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
