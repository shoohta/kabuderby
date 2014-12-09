class Company < ActiveRecord::Base
	belongs_to :category
	has_many :portfolios
	belongs_to :order
end
