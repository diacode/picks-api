class SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  
  def create
    render response_from_credentials
  end

  protected
    def response_from_credentials
      data = { email: params[:user][:email] }
      if res = resource_class.find_for_database_authentication(data)
        if res.valid_password?(params[:user][:password])
          data = {token: res.api_token, email: res.email}
          {json: data, status: 201}
        else
          invalid_response
        end
      else
        invalid_response
      end
    end

    def invalid_response
      {json: {error: "Invalid Login Details"}, status: 401}
    end
end