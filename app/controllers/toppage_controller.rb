class ToppageController < ApplicationController
  def index
  	@users = User.all
  end

  def mypage
  	@portfolios = current_user.portfolios
  end
  def rank
  	@users = User.all
  	@users.sort!{|user1, user2| user2.profit <=> user1.profit}
  end
  def order
  	@orders = current_user.orders
  end
end
