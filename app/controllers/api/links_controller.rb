class Api::LinksController < Api::BaseController
  respond_to :json

  # TODO: Add security
  def discover
    url = params[:url]
    link_data = Link.discover(url)
    respond_with Link.create(link_data), location: nil
  end

  def index
    respond_with Link.all
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    respond_with @link
  end

  private

  def link_params
    params.require(:link).permit(
      :title,
      :description,
      :category
    )
  end
end