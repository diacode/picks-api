class SessionsController < Devise::SessionsController
  def create
    resource = resource_from_credentials
    data     = {
      auth_token: resource.api_token,
      auth_email: resource.email
    }
    render json: data, status: 201
  end

  protected
    def resource_from_credentials
      data = { email: params[:email] }
      if res = resource_class.find_for_database_authentication(data)
        if res.valid_password?(params[:password])
          res
        end
      end
    end
end