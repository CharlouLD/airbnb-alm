class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.integer :night
      t.boolean :status
      t.date :check_in
      t.text :message

      t.timestamps null: false
    end
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :products
  end
end
