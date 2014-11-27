class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user
      t.integer :company
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
