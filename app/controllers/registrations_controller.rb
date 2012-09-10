class RegistrationsController < Devise::RegistrationsController
  
  before_filter :fetch_associations, :only => [:new, :create, :edit, :update]
  
  def new
  
   #select>
	 #	<option></option>
	 #	<optgroup label="United Kingdom">
	 #		<option>Southwest</option>
	 #		<option>North</option>
	 #	</optgroup>
	 #	<optgroup label="International">
	 #		<option>France</option>
	 #		<option>Japan</option>
	 #	</optgroup>
	 #</select>
    
    resource = build_resource({})
    respond_with resource
    
  end
  
  def edit
    render :edit
  end
  
  # We're overwriting the default create and update
  # so we can call save_talents - better way of doing this?
  
  def create
    build_resource

    if resource.save
      save_talents
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => member_path(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => member_path(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  def update
 
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      save_talents
      redirect_to member_path(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
    
  end
  
  def 
  
  def claim
    
    @user = User.where("activated = false && slug = #{params[:id]}")
    # check if params[:secret] = user.ning.id, probably want to 
    # put this fetch in the user model
    
    if @user.nil?
      not_found
    end
    
  end
  
  def activity
    
  end
  
  protected
    
    def fetch_associations
      @skills = Skill.all
      @locations = ["South","North"]
    end
    
    def save_talents
      if params[:skill]
        resource.talents.delete_all
        params[:skill].each do |i,skill|
          @skill = Skill.find(i)
          resource.talents.create(:skill_id => @skill.id, :level => skill)
        end
      end
    end
  
end