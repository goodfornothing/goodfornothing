ActiveAdmin.register Note do

  show do |note|

		attributes_table do 
	    row :title
      row :body
		end
		
		panel "Pevious Versions" do
			
			table :id => "versions" do
        thead do
          tr do
            th "Body"
            th "Time modified", :width => "150"
            th "Author", :width => "150"
          end
        end
        tbody do
          note.versions.reverse.each do |v|
						unless v.object.nil?
            	tr do
	              if v.previous.object.nil?
		 							td "[No diff available]"
								else
									td Diffy::Diff.new(v.previous.reify.body, v.reify.body).to_s(:html).html_safe
								end
	              td v.created_at.to_s(:long)
	            	td User.find(v.whodunnit).name
							end
						end
          end
        end
      end
		
		end
		
	end

end
