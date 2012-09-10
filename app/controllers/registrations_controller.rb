class RegistrationsController < Devise::RegistrationsController
  
  before_filter :fetch_associations, :only => [:new, :create, :edit, :update]
  prepend_before_filter :authenticate_scope!, :only => [:activity, :edit, :update, :destroy]
  
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
      save_activity
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
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
      save_activity
      redirect_to after_update_path_for(resource)
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
    @past_gigs = Gig.past
  end
  
  protected
    
    def after_update_path_for(resource)
      member_path(resource)
    end
    
    def after_sign_up_path_for(resource)
      member_path(resource)
    end
    
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
    
    def save_activity
      if params[:gigs]
        resource.slots.delete_all
        params[:gigs].each do |gig|
          @gig = Gig.find(gig)
          @gig.slots.first.users << resource
        end
      end
    end
  
end