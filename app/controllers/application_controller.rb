class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end

end
