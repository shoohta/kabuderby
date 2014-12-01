class ToppageController < ApplicationController
  def index
  	@users = User.all
  end

  def mypage
  	@orders = current_user.orders
  end
end
