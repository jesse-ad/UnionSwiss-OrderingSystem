class Sku < ApplicationRecord
  belongs_to :distributor
  belongs_to :product

  has_many :order_items

  validate :price_per_unit, presences: true, numericality: {greater_than: 0}
  validate :distributor_id, presence: true, uniqueness: true
  validate :product_id, presence: true, uniqueness: true
end
