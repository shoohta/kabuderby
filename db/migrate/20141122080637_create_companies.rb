class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :value
      t.integer :unit
      t.integer :category

      t.timestamps
    end
  end
end
