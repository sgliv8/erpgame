class ApplicationController < ActionController::Base

	before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue form for flash error message and redirection
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not allow to view this page!"
    redirect_to root_url
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :role_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :last_name, :email, :password, :password_confirmation, :current_password, :role_id) }
  end
end
