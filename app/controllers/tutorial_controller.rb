class TutorialController < ApplicationController
	before_action :set_company, only: [:buy, :confirm]

	def select
		@companies = Company.all
	end

	def buy
	end

	def confirm
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

end

