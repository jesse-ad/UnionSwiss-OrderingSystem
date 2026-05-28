class Distributor < ApplicationRecord

  # One distributor can have many users, many skus, many orders
  has_many :users
  has_many :skus
  has_many :orders

  validate :name, uniqueness: true
  validate :currency, uniqueness: true

end
