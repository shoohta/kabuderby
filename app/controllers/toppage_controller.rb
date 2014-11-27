class ToppageController < ApplicationController
  def index
  	@users = User.all
  end
   def current_user
    @current_user ||= User.find_by(id: session[:user])
  end
  def mypage
  end
end
