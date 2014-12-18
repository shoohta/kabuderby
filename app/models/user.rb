class User < ActiveRecord::Base
	 validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create

  #has_many ,belongs_to
  has_many :orders
  has_many :portfolios

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  def total_value
    i = 0
    self.portfolios.each do |portfolio|
      i += portfolio.company.value * portfolio.quantity
    end
    return i
  end

  def profit
    number = 0
    self.portfolios.each do |portfolio|
      number +=  portfolio.company.value * portfolio.quantity - portfolio.average * portfolio.quantity 
    end
    return number
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
