class Product < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :bookings
  validates :city,
            :description,
            :night_price,
            :owner,
            :title,
            presence: true

  has_attached_file :picture,
    styles: { large: "600X400>", medium: "300x200>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
