ActiveAdmin.register User do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 1, :label => "Members", :parent => "Community", :if => proc{ can?(:manage, User) }  
    
  filter :skills_id, :as => :check_boxes, :collection => proc {Skill.all}
  filter :name
  filter :email
  
  scope :all, :default => true
  scope :admins
  scope :leaders
  scope :causes
  scope :warblers
  
  actions :all, :except => [:new]

  sidebar :help do
    render "/hive/shared/help"
  end

	index do
    column :name
    column :email
    default_actions
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
    unless user.chapter.nil?
      panel "Chapter" do
        attributes_table_for user do
          row :chapter
        end
      end
    end
    panel "Privileges" do
      attributes_table_for user do
        row :role
        row "Activated from Ning?" do
          (user.activated) ? "Yes" : "No"
        end
      end
    end
    attributes_table do
      row :issues do 
        user.issues.map(&:title).join(', ')
      end
      row :talents do 
        user.talents.map { |t| "<strong>#{t.skill.title}:</strong> #{t.level}".html_safe }.join("<br />").html_safe
      end
      row :avatar
      row :name
      row :email
      row "Website" do 
        user.url
      end
      row :twitter_handle
      row :location
      row :gender
      row :age
      row :reasons_for_joining
      row "Extra skills" do
        user.brings
      end
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end

end
