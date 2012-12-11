ActiveAdmin.register Page do

	menu :parent => "Wiki", :if => proc{ can?(:manage, Page) } 

	config.clear_sidebar_sections!
  
	sidebar :help do
    render "/hive/shared/help"
  end
  
	index do
    column :title
		column "Last edited by" do |page|
			#User.find(page.latest.whodunnit).name
		end
    default_actions
  end

	form do |f|
		f.inputs "Content" do
			f.input :title
			f.input	:body
		end
    f.buttons
  end
	
  show do |page|

		attributes_table do 
	    row :title
      row "Body" do |page|
				sir_trevor_markdown(page.body)
			end
		end
		
		panel "Pevious Versions" do
			
			#table :id => "versions" do
      #  thead do
      #    tr do
      #      th "Body"
      #      th "Time modified", :width => "150"
      #      th "Author", :width => "150"
      #    end
      #  end
      #  tbody do
      #    page.versions.reverse.each do |v|
			#			unless v.object.nil?
      #      	tr do
	    #          if v.previous.object.nil?
		 	#						td "[No diff available]"
			#					else
			#						td Diffy::Diff.new(v.previous.reify.body, v.reify.body).to_s(:html).html_safe
			#					end
	    #          td v.created_at.to_s(:long)
	    #        	td User.find(v.whodunnit).name
			#				end
			#			end
      #    end
      #  end
      #end
		
		end
		
	end

end
