ActiveAdmin.register User do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  # menu :priority => 5, :label => "Members", :parent => "Community", :if => proc{ can?(:manage, User) }  
  menu :priority => 5, :label => "Members", :parent => "Community"  
  
	filter :chapter
  filter :name
	filter :email
	filter :brings, :label => "Special skills"
	
  scope :all, :default => true
  scope :admins
  scope :chapter_leaders do
    User.where(:role => ['admin', 'leader'])
  end
  scope :cause_owners do
    User.causes
  end
  scope :warblers
  
  actions :all, :except => [:new]

  sidebar :profile, :only => [:show,:edit] do
    span "The Nest only displays the non-public details of members, for more information about this member #{link_to "view their full profile", member_path(user)}".html_safe
  end
  
  sidebar :audit, :only => :show do
    attributes_table_for user do
      row "Last sign in" do
        user.last_sign_in_at
      end
      row "Last IP" do
        user.last_sign_in_ip
      end
    end
  end

  sidebar :help do
    render "/nest/shared/help"
  end

  csv do
    column :name 
    column :email 
    column :twitter_handle 
  end

	index do
    column("Name") { |user| link_to user.name, nest_user_path(user) }
    column("Chapter") { |user| link_to user.chapter.title, nest_chapter_path(user.chapter) unless !user.chapter.present?}
    # column("Twitter") { |user| link_to "#{user.twitter_handle}", "http://twitter.com/#{user.twitter_handle}" unless user.twitter_handle.nil? }
		# column("Social Login") { |user| user.list_authentications }
		column :created_at
    column("State") { |user| status_tag((user.activated) ? "Active" : "Inactive") }
    column "" do |user|
      "#{link_to "Edit", edit_nest_user_path(user)} &nbsp; #{link_to "Delete", nest_user_path(user), :method => "delete", :confirm => "Are you sure you wish to delete this member?"}".html_safe
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Privileges" do
      f.input :chapter
      # f.input :role, :as => :select, :collection => User::ROLES
      f.input :role, :as => :select, :collection => [['member', ''], ['warbler', 'warbler'], ['cause', 'cause'], ['leader','leader'], ['admin', 'admin']], :include_blank => false
      f.input :activated
    end
		f.inputs "Profile" do
			f.input :name
			f.input :email
			f.input :avatar
		end
    f.buttons
  end
  
  show do |user|
    
    panel "Status" do
      attributes_table_for user do
        row :role do
          if user.role == "leader"
            "Chapter Leader"
          elsif user.role == "owner"
            "Cause Owner"
          elsif user.role.present?
            user.role.titlecase
          end
        end
        row "Member of chapter" do
          user.chapter.title if user.chapter.present?
        end
        row "Activated?" do
          (user.activated) ? "Yes" : "No"
        end
      end
    end
    
    panel "Interests" do
      attributes_table_for user do
        row :issues do 
          user.issues.map(&:title).join(', ')
        end
				row "Special skills" do
					user.brings if user.brings.present?
				end
        row :reasons_for_joining
      end
    end
    
    panel "Contact" do
      attributes_table_for user do
        row :email
      end
    end
    
  end

end
