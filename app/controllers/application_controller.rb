class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :display_name, :bio, :location, :email, :password, :password_confirmation, :avatar) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :display_name, :bio, :location, :email, :password, :password_confirmation, :avatar) }
  end

  def after_sign_in_path_for(resource)
    users_path
  end
end
