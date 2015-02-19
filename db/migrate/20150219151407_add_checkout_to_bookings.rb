class AddCheckoutToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :checkout, :date
  end
end
