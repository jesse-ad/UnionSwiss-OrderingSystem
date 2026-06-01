class Order < ApplicationRecord
  # Each order belongs to the distributor and the user that created it.
  belongs_to :distributor
  belongs_to :user

  # An order consists if many order items
  has_many :order_items, dependent: :destroy

  # Ensure order numbers are unique and status is set at default
  before_validation :generate_order_number, on: :create
  before_validation :set_default_status, on: :create

  # Ensures order numbers are unqiue and present, and that a delivery date is present
  validates :order_number, uniqueness: true, presence: true
  validates :required_delivery_date, presence: true

  # Custom validation for only future delivery dates
  validate :future_delivery_date

  validates :status, inclusion: { in: %w[draft pending processing delivered cancelled] }

  # Ensure distributors can only select future delivery dates
  def future_delivery_date
    if required_delivery_date.present? && required_delivery_date <= Date.today # If chosen date exists and is before today's date
      errors.add(:required_delivery_date, "Delivery date must be in the future.") # Error
    end
  end

  # Calculates total price for order
  def total_price
    order_items.sum(&:total_price)
  end

  # Calculates total units for items
  def total_units
    order_items.sum do |item|
      item.pallets * 4800
    end
  end

  # Generates unique order number for every order
  # ChatGPT
  private
  def generate_order_number
    return if order_number.present?

    self.order_number = "ORD#{Order.count + 1}"
  end

  # Sets default status as pending
  def set_default_status
    return if status.present?

    self.status = "draft"
  end
end
