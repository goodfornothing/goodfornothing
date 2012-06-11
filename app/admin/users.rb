ActiveAdmin.register User do
  
  menu :priority => 1, :label => "Members"
  
	index do
    column :name
    column :email
    column "Admin" do |user|
      (user.admin?) ? "Yes" : "No"
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :admin
      f.input :skills, :as => :check_boxes
    end
    f.buttons
  end
  
  show do |user|
    attributes_table do
      row :name
      row :email
      row :admin
      row :skills do 
        user.skills.map(&:title).join(', ')
      end
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end

end
