class AddOnlineColumn < ActiveRecord::Migration
  def change
    add_column :products, :online, :boolean, default: true
  end
end
