class Product < ApplicationRecord

  has_many :skus

  validates :name, presence: true, uniqueness: true
 
end
