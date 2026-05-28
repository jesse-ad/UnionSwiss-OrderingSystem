class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user can be a distributor and can have many orders
  belongs_to :distributor, optional: true

  has_many :orders

  vaidates :role, presence: true
end
