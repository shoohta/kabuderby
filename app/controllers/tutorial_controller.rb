class TutorialController < ApplicationController
	before_action :set_company, only: [:buy, :confirm, :confirm]

	def select
		@companies = Company.all
	end

	def buy
		@order = Order.new(company_id: params[:id], order_value: @company.value)
	end
	def confirm
		@order = current_user.orders.build(order_params)
	end

	def complete
		current_user.orders.create(order_params)
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


end

