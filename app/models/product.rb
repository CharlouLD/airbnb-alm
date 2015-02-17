class Product < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :bookings
  validates :user, :description, :city, :night_price, :title, presence: true
end
