class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sku

  validates :pallets, numericality: {greater_than_0: 0}


  # Calculates total price for item
  def total_price
    pallets * 4800 * sku.price_per_unit
  end

end