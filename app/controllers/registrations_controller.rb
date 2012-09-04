class RegistrationsController < Devise::RegistrationsController
  
  def update
 
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
    
  end
  
  def claim
    
    @user = User.where("activated = false && slug = #{params[:id]}")
    # check if params[:secret] = user.ning.id, probably want to 
    # put this fetch in the user model
    
    if @user.nil?
      not_found
    end
    
  end
  
  protected
  
    def after_update_path_for(resource)
      user_path(resource)
    end
  
end