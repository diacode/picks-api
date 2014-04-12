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
end