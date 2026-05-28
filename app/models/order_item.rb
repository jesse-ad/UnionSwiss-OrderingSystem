class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sku

  validates :pallets, numericality: {greater_than_or_equal_to: 0}
end
