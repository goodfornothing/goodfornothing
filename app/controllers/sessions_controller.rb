class SessionsController < Devise::SessionsController
  before_filter :check_for_ning_user, :only => :create
  
  private
  
    def check_for_ning_user
      
      user = User.find_by_email(params[:user][:email])
      unless user.nil? or user.ning_profile.nil? or user.activated?
        redirect_to reactivate_path(:email => user.email)
      end
      
    end
  
end