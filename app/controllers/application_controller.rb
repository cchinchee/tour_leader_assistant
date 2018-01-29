class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def cities
    render json: CS.cities(params[:state], :my).to_json
  end
end
