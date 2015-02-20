class Product < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :bookings
  validates :address,
            :description,
            :night_price,
            :owner,
            :title,
            presence: true

  has_attached_file :picture,
    styles: { large: "600X400>", medium: "300x200>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def available?(checkin, checkout)
    output = true
    bookings.each do |booking|
      if booking.status && (booking.check_in <= checkout && booking.checkout >= checkin)
        output = false
      end
    end
    output
  end
end
