class Order < ApplicationRecord
  belongs_to :distributor
  belongs_to :user

  has_many :order_items

  validates :order_number, uniqueness: true, presence: true
  validates :required_delivery_date, presence: true
end
