class Sku < ApplicationRecord
  belongs_to :distributor
  belongs_to :product

  has_many :order_items

  validates :price_per_unit, presence: true, numericality: {greater_than: 0}
  validates :distributor_id, presence: true, uniqueness: true
  validates :product_id, presence: true, uniqueness: true
end
