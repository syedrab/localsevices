class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  $service_areas = ServiceArea.all.group(:city)
  $service_types = ServiceType.all

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end

  # def after_sign_in_path_for(user)
  # 	if user.role_id == 2
  # 		dashboard_index_path
  # 	else
  # 		home_index_path
  # 	end

  # end

end
