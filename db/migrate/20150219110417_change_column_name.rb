class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :city, :address
  end
end
