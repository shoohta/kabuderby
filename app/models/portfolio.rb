class Portfolio < ActiveRecord::Base
	has_many :orders
	accepts_nested_attributes_for :orders
	

	validates :quantity, :presence => true
	validates :company_id, :presence => true
	validates :order_value, :presence => true

	has_many :users
	has_many :users
	belongs_to :company
end
