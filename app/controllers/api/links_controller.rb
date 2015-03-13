class Api::LinksController < Api::BaseController
  respond_to :json

  def create
    url = params[:link][:url]
    link_data = Link.discover(url)
    respond_with Link.create(link_data), location: nil
  end

  def index
    @links = Link.unused
    filter_by_approval if params[:approved].present?
    respond_with @links
  end

  def show
    respond_with Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    respond_with @link
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    render json: nil, status: :ok
  end

  private

  def link_params
    params.require(:link).permit(
      :title,
      :description,
      :category,
      :approved
    )
  end

  def filter_by_approval
    if params[:approved] == 'true'
      @links = @links.approved
    else
      @links = @links.unapproved
    end
  end
end