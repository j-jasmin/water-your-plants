class ApplicationController < ActionController::Base
  layout "application"
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || plants_path
  end
end
