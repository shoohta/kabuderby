class AddAverageToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :average, :integer
  end
end
