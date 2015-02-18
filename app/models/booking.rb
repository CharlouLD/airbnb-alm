class Booking < ActiveRecord::Base
  belongs_to :customer, class_name: 'User', foreign_key: :user_id
  belongs_to :product

  has_one :owner, through: :product

  validates :check_in,
            :customer,
            :night,
            :product,
            presence: true

def check_out
  self.check_in + self.night
end

end
