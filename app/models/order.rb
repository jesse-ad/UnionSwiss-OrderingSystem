class Order < ApplicationRecord
  belongs_to :distributor
  belongs_to :user

  has_many :order_items

  validates :order_number, uniqueness: true, presence: true
  validates :required_delivery_date, presence: true

  # Custom validation for only future delivery dates
  validate :future_delivery_date


  # Checks that date is in the future
  def future_delivery_date
    if required_delivery_date.present? && required_delivery_date <= Date.today # If chosen date exists and is before today's date
      errors.add(:required_delivery_date, "Delivery date must be in the future.") # Error
    end
  end

end
