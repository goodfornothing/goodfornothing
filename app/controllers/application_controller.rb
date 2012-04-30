class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
  	redirect_to new_user_session_path and return if user_signed_in? && !current_user.admin? 
    authenticate_user!
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin? 
    current_user 
   end

end