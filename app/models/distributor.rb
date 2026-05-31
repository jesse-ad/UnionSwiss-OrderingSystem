class Distributor < ApplicationRecord

  # One distributor can have many users, many skus, many orders
  has_many :users, dependent: :destroy
  has_many :skus, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, uniqueness: true
  validates :currency, presence: true

end
