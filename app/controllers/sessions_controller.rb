class SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  
  def create
    resource = resource_from_credentials
    data     = {
      token: resource.api_token,
      email: resource.email
    }
    render json: data, status: 201
  end

  protected
    def resource_from_credentials
      data = { email: params[:user][:email] }
      if res = resource_class.find_for_database_authentication(data)
        if res.valid_password?(params[:user][:password])
          res
        end
      end
    end
end