class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :address, :f_name, :l_name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :f_name, :l_name, :photo])
  end
end