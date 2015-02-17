class Booking < ActiveRecord::Base
  belongs_to :customer, class_name: 'User', foreign_key: :user_id
  belongs_to :product
  belongs_to :owner, through: :product
  validates :user, :product, :check_in, :nights, presence: true
end
