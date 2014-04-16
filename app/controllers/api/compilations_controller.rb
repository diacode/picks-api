class Api::CompilationsController < Api::BaseController
  respond_to :json

  def create
    respond_with Compilation.create, location: nil
  end

  def index
    respond_with Compilation.all
  end
end
