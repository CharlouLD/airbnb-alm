class Product < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :bookings
  validates :city,
            :description,
            :night_price,
            :owner,
            :title,
            presence: true
end
