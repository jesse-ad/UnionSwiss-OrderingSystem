class Product < ApplicationRecord
  # A product can have many SKUs
  has_many :skus

  # Ensures all products have a name and it's unique
  validates :name, presence: true, uniqueness: true
end
