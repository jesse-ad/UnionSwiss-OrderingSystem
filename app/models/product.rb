class Product < ApplicationRecord

  has_many :skus

  validate :name, presence: true, uniqueness: true

end
