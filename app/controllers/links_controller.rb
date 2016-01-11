class LinksController < ApplicationController
  def index
    if current_user
    else
      flash[:notice] = "You must be logged in"
      redirect_to root_path
    end
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.save
      redirect_to "/links"
    else
      flash.now[:notice] = link.errors.full_messages.join(", ")
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
