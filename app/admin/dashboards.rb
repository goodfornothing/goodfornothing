ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => "Welcome to the Hive" do
    
		columns do
		  column do
		    panel "Unread Messages" do
		      
		    end
		  end
    
		  column do
		    panel "Unpublished Trills" do
		    end
		  end
		end

  end

end