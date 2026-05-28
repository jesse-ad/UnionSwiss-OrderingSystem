class Sku < ApplicationRecord
  belongs_to :distributor
  belongs_to :product

  has_many :order_items
end
