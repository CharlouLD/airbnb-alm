class Booking < ActiveRecord::Base
  belongs_to :customer, class_name: 'User', foreign_key: :user_id
  belongs_to :product

  has_one :owner, through: :product

  validates :customer, :product, :check_in, :night, presence: true
end
