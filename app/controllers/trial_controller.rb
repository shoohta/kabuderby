class TrialController < ApplicationController
	before_action :set_company, only: [:buy, :confirm, :complete, :select_sell, :sell, :sell_confirm, :sell_complete, :order]
	before_action :set_user,only: [:select, :buy, :confirm, :complete]
	def select
		@companies = Company.all
	end
	def buy
		@order = Order.new(company_id: params[:id], order_value: @company.value)
		@portfolio = Portfolio.new(company_id: params[:id], )
	end
	def confirm
		@order = Order.new(company_id: params[:id], order_value: @company.value, quantity: params[:order][:quantity], user_id: @user.id)
		if params[:order][:quantity].to_i % 100 != 0
			@error_message = 'error'
			render 'buy'
		end
	end
	def complete

	end
	def select_sell
	end
	def sell
		@order = Order.new(company_id: params[:id], order_value: @company.value)
	end
	def sell_confirm
		@order = Order.new(company_id: params[:id], order_value: @company.value)
	end
	def sell_complete
	end
	def order
	end

	private
	def set_company 
      #params[id]に/users/数でとってきた値を入れている
      @company = Company.find(params[:id])
    end
    def set_user
    	@user = User.find_by(id: 1)
    end

end
