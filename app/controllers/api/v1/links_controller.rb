class Api::V1::LinksController < ApplicationController
  respond_to :json

  def show
    respond_with current_user.links.find(params[:id])
  end

  def index
    respond_with current_user.links.all
  end

  def create
    respond_with :api, :v1, current_user.links.create(links_params)
  end

  def update
    respond_with current_user.links.find(params[:id]).update(links_params)
  end

  def destroy
    respond_with current_user.links.destroy(params[:id])
  end

  private

  def links_params
    params.permit(:title, :url, :read)
  end
end
