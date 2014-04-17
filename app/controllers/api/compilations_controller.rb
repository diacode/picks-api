class Api::CompilationsController < Api::BaseController
  respond_to :json

  def create
    respond_with Compilation.create(compilation_params), location: nil
  end

  def index
    respond_with Compilation.all
  end

  def compilation_params
    params.require(:compilation).permit(:link_ids)
  end
end
