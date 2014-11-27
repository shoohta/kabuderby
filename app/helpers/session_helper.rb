module SessionHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  #current_userの存在の確認
  def current_user?(user)
    user == current_user
  end
  def sign_out
  	self.current_user = nil
  	cookies.delete(:remember_token)
  end
  def signed_in_user
      #signin_urlへ飛ばす
      #signin_path => /signin
      #signin_url => localhost:3000/signin
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

end