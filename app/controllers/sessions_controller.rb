class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
