class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sku

  validates :pallets, numericality: {greater_than_0: 0}
end
