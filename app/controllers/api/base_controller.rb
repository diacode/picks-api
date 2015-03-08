class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  
  # This is Devise's authentication
  before_filter :authenticate_user!

  private
    # Token authentication based on:
    # https://github.com/simplabs/ember-simple-auth/tree/master/packages/ember-simple-auth-devise#server-side-setup
    def authenticate_user_from_token!
      authenticate_with_http_token do |token, options|
        user_email = options[:email].presence
        user = user_email && User.find_by_email(user_email)

        if user && Devise.secure_compare(user.api_token, token)
          sign_in user, store: false
        end
      end
    end
end
