class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  
  # This is Devise's authentication
  before_filter :authenticate_user!

  private
    # Token authentication based on this Jose Valim gist.
    # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
    def authenticate_user_from_token!
      user_email = params[:api_email].presence
      user       = user_email && User.find_by_email(user_email)
   
      # Notice how we use Devise.secure_compare to compare the token
      # in the database with the token given in the params, mitigating
      # timing attacks.
      if user && Devise.secure_compare(user.api_token, params[:api_token])
        sign_in user, store: false
      end
    end
end
