class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Proszę się zalogować"
      redirect_to new_user_session_path
    end
  end

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end
end
