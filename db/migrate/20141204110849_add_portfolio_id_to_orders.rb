class AddPortfolioIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :portfolio_id, :integer
  end
end
