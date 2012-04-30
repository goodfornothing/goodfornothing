ActiveAdmin.register User do
  
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
    end
    f.buttons
  end

end
