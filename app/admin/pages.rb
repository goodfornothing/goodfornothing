ActiveAdmin.register Page do

  actions :all, :except => [:new]

	menu :if => proc{ can?(:manage, Page) }, label: "Wiki"

	config.clear_sidebar_sections!
    
  index :download_links => false, title: "Wiki" do
    render "/hive/shared/help"
  end

	form do |f|
		f.inputs "Content" do
			f.input :title
			f.input :description
			f.input :featured
		end
		f.inputs "Body" do
      if page.new_record? || page.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
    f.buttons
  end
	
  show do |page|
		
		attributes_table do 
	    row :title
			row :description
	    row :featured
			row :body do
       if page.body.is_json?
   		   render_sir_trevor(page.body)
   		 else
   		   simple_format(page.body).html_safe
   	   end
   	  end
		end
		
		#panel "Pevious Versions" do
		#	
		#	table :id => "versions" do
    #    thead do
    #      tr do
    #        th "Body"
    #        th "Time modified", :width => "150"
    #        th "Author", :width => "150"
    #      end
    #    end
    #    #tbody do
    #    #  page.versions.reverse.each do |v|
		#		#		unless v.object.nil?
    #    #    	tr do
	  #    #        if v.previous.object.nil?
		# 		#					td "[First version - no diff available]"
		#		#				else
		#		#					td Diffy::Diff.new(v.previous.reify.body, v.reify.body).to_s(:html).html_safe
		#		#				end
	  #    #        td v.created_at.to_s(:long)
	  #    #      	td User.find(v.whodunnit).name
		#		#			end
		#		#		end
    #    #  end
    #    #end
    #  end
		#
		#end
		
	end

end
