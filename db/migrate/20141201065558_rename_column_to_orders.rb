class RenameColumnToOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :company, :company_id
  	rename_column :orders, :user, :user_id
  end
end
