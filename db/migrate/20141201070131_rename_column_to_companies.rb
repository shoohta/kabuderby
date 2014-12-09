class RenameColumnToCompanies < ActiveRecord::Migration
  def change
  	rename_column :companies, :category, :category_id
  end
end
