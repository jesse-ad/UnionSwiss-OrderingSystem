class OrderItem < ApplicationRecord
  # Each order item belongs to an order and a SKU
  belongs_to :order
  belongs_to :sku

  validates :pallets, numericality: { greater_than: 0 }


  # Calculates total price for order item
  def total_price
    pallets * 4800 * sku.price_per_unit
  end
end
