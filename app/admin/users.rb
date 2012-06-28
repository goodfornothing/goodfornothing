ActiveAdmin.register User do
  
  menu :priority => 1, :label => "Members", :parent => "People"
    
  filter :skills_id, :as => :check_boxes, :collection => proc {Skill.all}
  
	index do
    column :name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Privileges" do
      f.input :approved
      f.input :admin
    end
    f.buttons
  end
  
  show do |user|
    unless user.chapter.nil?
      panel "Running" do
        attributes_table_for user do
          row :chapter
        end
      end
    end
    panel "Privileges" do
      attributes_table_for user do
        row "Is admin?" do
          (user.admin) ? "Yes" : "No"
        end
        row "Approved?" do
          (user.approved) ? "Yes" : "No"
        end
      end
    end
    attributes_table do
      row :avatar
      row :name
      row :email
      row :skills do 
        user.skills.map(&:title).join(', ')
      end
      row "Website" do 
        user.url
      end
      row :twitter_handle
      row :location
      row :gender
      row :age
      row :reasons_for_joining
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end

end
