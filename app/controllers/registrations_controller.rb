class RegistrationsController < Devise::RegistrationsController
  
  before_filter :fetch_associations, :only => [:new, :create, :edit, :edit_talents, :update, :edit_moar, :edit_notifications]
  prepend_before_filter :authenticate_scope!, :only => [:edit_activity, :edit_talents, :edit_password, :edit_notifications, :edit, :edit_moar, :update, :destroy, :update_activity, :update_talents, :update_password]
  
  def new
		@similar = User.limit(12).collect
    resource = build_resource({})
    @form_defaults = {}
    if session["omniauth"]
      @form_defaults[:name] = session["omniauth"]["info"]["name"]
      if session["omniauth"]["provider"] == 'facebook'
        @form_defaults[:email] = session["omniauth"]['extra']['raw_info']['email']
      else
        @form_defaults[:email] = ''
      end
    else 
      @form_defaults[:name] = ''
      @form_defaults[:email] = ''
    end
    respond_with resource
  end
  
  def edit
  end
  
  def edit_moar 
    @faces = User.where('avatar is not null && avatar != ""').order('created_at ASC').limit(6)
  end
  
  def edit_talents    
  end
  
  def edit_activity
    @past_gigs = Gig.past.order('start_time DESC')
  end

	def edit_notifications
		
	end

  def create
    
    # session[:omniauth] = nil unless @user.new_record?

    # hack to check for spam signups, sorry
    if params[:user][:reasons_for_joining].include?('<a')
      abort_register and return
    end

    if params[:user][:brings].blank?
      abort_register and return
    end
    
    ning_user = User.joins(:ning_profile).where('users.email = ? && users.activated = ?', params[:user][:email], false).first
    
    unless ning_user.nil?
      
      redirect_to reactivate_path(:email => ning_user.email, :route => "create")
      
    else
      
      build_resource
          
      if resource.save
      
        save_talents(resource)
        check_subscription(resource)
        AdminMailer.new_user(resource).deliver
        AdminMailer.welcome(resource).deliver
      
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
  end
  
  def update_talents
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      save_talents(resource)
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit_talents
    end
  end
  
  def update_activity
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      save_gig_activity
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit_activity
    end
  end
  
  def update
    
    if resource.update_attributes(params[resource_name])
      
      check_subscription(resource)
      
      sign_in resource_name, resource, :bypass => true
      if remotipart_submitted?
        render :update, :format => "js"
      elsif request.xhr?
        render :json => { :status => 200, :data => { :chapter => resource } }
      else
        set_flash_message :notice, :updated
        redirect_to after_update_path_for(resource)
      end
      
    else
      
      if request.xhr?
        render :json => { :status => 400, :data => { :message => "Something went wrong, please try again" } }
      else
        render :edit
      end
      
    end
    
  end
    
  def reactivate
    @new_user = params[:route]
    @user = User.where("activated = false && email = '#{params[:email]}'").first
    if @user.nil?
      not_found
    end
  end
  
  def send_reactivation
    @user = User.where("activated = false && email = '#{params[:user][:email]}'").first
    if @user.nil?
      not_found
    else
      UserMailer.reactivate_user(@user).deliver
    end
  end
  
  def claim
    if params[:reset_password_token].blank?
      not_found
    else
      @user = User.new
    end
  end
  
  def activate
    
    params[:reset_password_token] = params[:user][:reset_password_token]
    
    if !params[:user][:password].blank?
    
      @user = User.reset_password_by_token(params[:user])

      if @user.errors.empty?
        @user.activated = true
        @user.subscribed = true
        @user.save!
        flash_message = @user.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message(:notice, flash_message) if is_navigational_format?
        sign_in(User, @user)
        redirect_to member_path(@user, :welcome=>"yahuh")
      else
        flash[:error] = @user.errors.inspect.to_s
        render :claim
      end
      
    else
      flash[:error] = "Your password can not be blank"
      render :claim
    end
    
  end 
  
  protected
  
    def abort_register
      redirect_to('/how-it-works') 
    end
    
    def check_subscription(resource)
      if resource.activated?
        # The master GFN mailing list
        mc = Gibbon.new(ENV['MC_API_KEY'], { :throws_exceptions => false} )
        
        # The individual chapter mailing list.
        chapter = Chapter.find(resource.chapter_id)
        chapter_mc = Gibbon.new(chapter["mailchimp_api_key"], { :throws_exceptions => false} )

        if resource.subscribed?
          # if !chapter.empty?
            mc.list_subscribe({:id => ENV['MC_LIST_ID'], :email_address => resource.email, :merge_vars => { "Chapter City" => chapter.title, :GROUPINGS => [ { :name => 'Source', :groups => 'Platform' } ] }, :double_optin => false, :send_welcome => false })
          # else
            # mc.list_subscribe({:id => ENV['MC_LIST_ID'], :email_address => resource.email, :merge_vars => { :GROUPINGS => [ { :name => 'Source', :groups => 'Platform' } ] }, :double_optin => false, :send_welcome => false })
          # end
          chapter_mc.list_subscribe({:id => chapter["mailchimp_list_id"], :email_address => resource.email, :merge_vars => { :GROUPINGS => [ { :name => 'Source', :groups => 'Platform' } ] }, :double_optin => false, :send_welcome => false })
        else
          mc.list_unsubscribe({:id => ENV['MC_LIST_ID'], :email_address => resource.email, :send_goodbye => false, :send_notify => false})
          chapter_mc.list_unsubscribe({:id => chapter["mailchimp_list_id"], :email_address => resource.email, :send_goodbye => false, :send_notify => false})
        end
      end
    end
    
    def fetch_associations
      @skills = Skill.all
      @locations = ["South","North"]
    end
    
    def save_talents(resource)
      if params[:skill]
        resource.talents.destroy_all
        params[:skill].each do |i,skill|
          @skill = Skill.find(i)
          resource.talents.create(:skill_id => @skill.id, :level => skill)
        end
      end
    end
    
    def save_gig_activity
      if params[:gigs]
        resource.slots.each do |slot|
          slot.users.delete(resource) unless slot.gig_id.nil? || slot.gig.future?
        end
        params[:gigs].each do |gig|
          @gig = Gig.find(gig)
          @gig.slots.first.users << resource
        end
      end
    end
    
    def after_update_path_for(resource)
       member_path(resource)
    end
    
    def after_sign_up_path_for(resource)
       stored_location_for(resource) || member_path(resource, :welcome=>"yahuh")
    end

    def build_resource(*args)
      super
      if session[:omniauth]
        @user.apply_omniauth(session[:omniauth])
        session[:omniauth] = nil unless @user.new_record?
        
        # @user.valid?
      end
    end
  
end