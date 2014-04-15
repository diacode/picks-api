class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Token generation based on this Jose Valim gist.
  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  before_save :ensure_authentication_token
  
  def ensure_authentication_token
    if api_token.blank?
      self.api_token = generate_api_token
    end
  end
  
  private
  
  def generate_api_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(api_token: token).first
    end
  end
end
