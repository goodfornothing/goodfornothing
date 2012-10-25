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
            th "Body diff"
            th "Time modified"
            th "Author"
          end
        end
        tbody do
          note.versions.reverse.each do |v|
						unless v.object.nil?
            	tr do
	              td (v.previous.object.nil?) ? "[No diff available]" : Diffy::Diff.new(v.previous.reify.body, v.reify.body).to_s(:html).html_safe
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
