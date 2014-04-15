class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  
  # This is Devise's authentication
  before_filter :authenticate_user!

  private
    # Token authentication based on:
    # https://github.com/simplabs/ember-simple-auth/tree/master/packages/ember-simple-auth-devise#the-authorizer
    def authenticate_user_from_token!
      token = request.headers['auth-token'].to_s
      email = request.headers['auth-email'].to_s
      return unless token && email

      user = User.find_by_email(email)

      if user && Devise.secure_compare(user.api_token, token)
        sign_in user, store: false
      end
    end
end
