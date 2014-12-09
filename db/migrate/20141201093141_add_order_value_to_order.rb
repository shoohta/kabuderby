class AddOrderValueToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_value, :integer
  end
end
