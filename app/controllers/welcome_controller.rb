class WelcomeController < ApplicationController
  def index
    authorize
  end
end
