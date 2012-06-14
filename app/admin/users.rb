ActiveAdmin.register User do
  
  menu :priority => 1, :label => "Members", :parent => "People"
  
  config.clear_sidebar_sections!
  
	index do
    column :name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :skills, :as => :check_boxes
    end
    f.inputs "Privileges" do
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
    attributes_table do
      row :avatar
      row :name
      row :email
      row :skills do 
        user.skills.map(&:title).join(', ')
      end
      row "Is admin?" do
        (user.admin) ? "Yes" : "No"
      end
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end

end
