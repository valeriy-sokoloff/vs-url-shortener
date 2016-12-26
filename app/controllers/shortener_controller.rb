class ShortenerController < ApplicationController

  def index
  end

  def create
    @link = Link.find_or_create_by( original_url: link_params )
    @short_url = short_url(@link) unless @link.errors.any?

    render 'index'
  end

  def redirect
    @link = Link.where(id: @hasher.decode(redirect_params) ).first

    redirect_to ( @link.try(:original_url) || root_path )
  end

  private

  def link_params
    params.require(:link).require(:original_url)
  end

  def short_url( link )
    "#{request.protocol}" + "#{request.host_with_port}" + "/#{ @hasher.encode(link.id) }"
  end

  def redirect_params
    params.require(:hash_id)
  end

end
