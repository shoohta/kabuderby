class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	belongs_to :category
	belongs_to :portfolio
end
