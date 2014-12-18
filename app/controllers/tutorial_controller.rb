class TutorialController < ApplicationController
	before_action :set_company, only: [:buy, :confirm, :complete, :sell, :sell_complete]
	before_action :set_portfolio, only: [:confirm, :sell, :sell_confirm, :sell_complete]

	def select
		@companies = Company.all
	end

	def buy
		@order = Order.new(company_id: params[:id], order_value: @company.value)
		@portfolio = Portfolio.new(company_id: params[:id], )
	end

	def confirm
		@portfolio = Portfolio.find_by(company_id: params[:id])
		@order = Order.new(company_id: params[:id], order_value: @company.value, quantity: params[:order][:quantity] )
		if params[:order][:quantity].to_i % 100 != 0
			@error_message = 'error'
			render 'buy'
		end
	end

	def complete
		@order = Order.new(user_id: current_user.id, company_id: params[:id], quantity: params[:order][:quantity], order_value: params[:order][:order_value])
		@order.status = '買'
		@order.save
		@cash = current_user.cash - @order.order_value * @order.quantity
		current_user.cash = @cash
		current_user.save
		user = User.find_by(id: current_user.id)
		user.cash - @company.value * @order.quantity
		if user.save
			logger.debug('@@@@@@')
		else
			logger.debug(user.inspect)
		end
		if ! Portfolio.find_by(company_id: params[:id])
			portfolio = Portfolio.new(company_id: params[:id], user_id: current_user.id, quantity: params[:order][:quantity], average: params[:order][:order_value], unit: params[:order][:unit])
		else
			portfolio = Portfolio.find_by(company_id: params[:id]) 
			portfolio.quantity = portfolio.quantity + @order.quantity
		end
		portfolio.save
	end

	def select_sell
		@portfolios = current_user.portfolios
	end
	def sell
		@order = Order.new(company_id: params[:id], order_value: @company.value)
	end

	def sell_confirm
		@order = current_user.orders.build(order_params)
		
		#@portfolio = Portfolio.new(company_id: params[:id] quantity:)
		
	end

	def sell_complete
		@order = Order.new(user_id: current_user.id, company_id: params[:id], quantity: params[:order][:quantity], order_value: params[:order][:order_value])
		@order.status = '売'
		@order.save

		user = User.find_by(id: current_user.id)
		user.cash = user.cash + @order.order_value * @order.quantity
		if user.save
			logger.debug('@@@@@@')
		else
			logger.debug(user.inspect)
		end
		@portfolio = Portfolio.new(company_id: params[:id], user_id: current_user.id)
		portfolio = Portfolio.find_by(company_id: params[:id])
		portfolio.quantity = portfolio.quantity - @order.quantity
		portfolio.save

		#portfolio = Portfolio.find_by(company_id: params[:id])
		#portfolio.quantity = portfolio.quantity - @order.quantity
		#if portfolio.save
		#	logger.debug('@@@@@@')
		#else
		#	logger.debug(portfolio.inspect)
		#end
	end

	private
    # Use callbacks to share common setup or constraints between actions.

    def set_company 
      #params[id]に/users/数でとってきた値を入れている
      @company = Company.find(params[:id])
    end

    def tutorial_params
      params.require(:companies).permit(:name, :value, :unit)
    end
    
    def order_params
    	params.require(:order).permit(:quantity, :company_id, :order_value)
    end
    def set_portfolio
    	@portfolio = Portfolio.find_by(company_id: params[:id])
    end
   

end

