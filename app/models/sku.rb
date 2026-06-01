class Sku < ApplicationRecord
  # A SKU belongs to a distributor and a product (It links the distributor to the product)
  belongs_to :distributor
  belongs_to :product

  # A SKU can appear more than once for an order item
  has_many :order_items

  # Ensure there's a price for each SKU and that it is more than 0
  validates :price_per_unit, presence: true, numericality: { greater_than: 0 }
  validates :distributor_id, presence: true # Ensures distributor exists
  validates :product_id, presence: true # Ensures product exists

  def display_name
    product.name
  end
end
