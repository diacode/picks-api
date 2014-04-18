class Api::CompilationsController < Api::BaseController
  respond_to :json

  def create
    respond_with Compilation.create(compilation_params), location: nil
  end
  
  def update
    @compilation = Compilation.find(params[:id])
    @compilation.update_attributes(compilation_params)
    respond_with @compilation
  end

  def index
    respond_with Compilation.all
  end

  def show
    respond_with Compilation.find params[:id]
  end

  def compilation_params
    params.require(:compilation).permit(:intro, link_ids: [])
  end
end
