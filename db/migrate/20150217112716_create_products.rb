class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.string :city
      t.integer :night_price

      t.timestamps null: false
    end
    add_foreign_key :products, :users
  end
end
