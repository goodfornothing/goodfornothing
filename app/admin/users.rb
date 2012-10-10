ActiveAdmin.register User do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :label => "Members", :parent => "Community", :if => proc{ can?(:manage, User) }  
  
  filter :activated, :as => :select
  filter :name
  filter :email
  
  scope :all, :default => true
  scope :admins
  scope :chapter_leaders do
    User.leaders
  end
  scope :cause_owners do
    User.causes
  end
  scope :warblers
  
  actions :all, :except => [:new]

  sidebar :profile, :only => [:show,:edit] do
    span "The Hive only displays the non-public details of members, for more information about this member #{link_to "view their full profile", member_path(user)}".html_safe
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
    render "/hive/shared/help"
  end

	index do
    column("Name") { |user| link_to user.name, hive_user_path(user) }
    column :email
    column("State") { |user| status_tag((user.activated) ? "Active" : "Inactive") }
    column "" do |user|
      "#{link_to "Edit", edit_hive_user_path(user)} &nbsp; #{link_to "Delete", hive_user_path(user), :method => "delete", :confirm => "Are you sure you wish to delete this member?"}".html_safe
    end
  end

  form do |f|
    f.inputs "Privileges" do
      f.input :chapter
      f.input :role, :as => :select, :collection => User::ROLES
      f.input :activated
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
          else
            user.role.titlecase
          end
        end
        row "Member of chapter" do
          user.chapter.title
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
