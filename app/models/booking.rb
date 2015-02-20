class Booking < ActiveRecord::Base
  after_create :send_booking_email

  belongs_to :customer, class_name: 'User', foreign_key: :user_id
  belongs_to :product

  has_one :owner, through: :product

  validates :check_in,
            :customer,
            :checkout,
            :product,
            presence: true


  def send_booking_email
    UserMailer.booking_sent(self.customer).deliver
    UserMailer.booking_for_you(self.owner).deliver
  end

end
