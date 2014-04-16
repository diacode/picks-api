class Api::CompilationsController < Api::BaseController
  respond_to :json

  def create
    respond_with Link.create, location: nil
  end
end
