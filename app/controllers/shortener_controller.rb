class ShortenerController < ApplicationController

  def index
  end

  def create
    @link = Link.find_or_create_by( original_url: link_params )
    @short_url = short_url(@link)
    render 'index'
  end

  private

  def link_params
    params.require(:link).require(:original_url)
  end

  def short_url( link )
    "#{request.protocol}" + "#{request.host_with_port}" + "/#{@hasher.encode(link.id)}"
  end

end
