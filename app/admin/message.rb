ActiveAdmin.register Messaging::Message, :as => "Message" do

	menu :priority => 1, :if => proc{ can?(:manage, Messaging::Message) } 
	
	controller do
    load_resource :except => :index
    authorize_resource :class => "Messaging::Message"
  end

	filter :created_at
	
	sidebar :help do
    render "/hive/shared/help"
  end

  actions :index, :destroy, :edit, :update, :show
	
	scope :messages, :default => true do
		current_user.inbox.where("submission_type IS NULL")
	end
	scope :partner_request do
		current_user.inbox.where("submission_type = ?", 'Messaging::Partner')
	end
	scope :challenge_submissions do
		current_user.inbox.where("submission_type = ?", 'Messaging::Challenge')
	end
	scope :chapter_sign_ups do
		current_user.inbox.where("submission_type = ?", 'Messaging::Chapter')
	end

	index do
    column("From") { |m| m.from_name }
		column("Read") { |m| status_tag((m.read) ? "Read" : "Unread") }
    column :created_at
		default_actions
  end

	show do |message|
		panel 'Details' do
      attributes_table_for message do
				row :from_name
				row :from_email
				row "From a member?" do
					if message.user.nil? 
						"No"
					else
						"Yes, #{link_to message.user.name, hive_user_path(message.user)}".html_safe
					end
				end	
				row "Recipients" do 
		    	message.users.map(&:name).join(', ')
		    end
			end
		end
		panel 'Content' do
			attributes_table_for message do
				row :body unless message.body.nil?
			 	unless message.submission.nil?
					message.submission.attributes.each do |attr|
						if (attr[0] != "id" && attr[0] != "created_at" && attr[0] != "updated_at")
							row "#{attr[0]}" do
								simple_format attr[1]
							end
						end
					end
				end
			end
		end
	end
	
	sidebar 'Status', :only => :show do
    attributes_table_for message do
			row "Read?" do
      	(message.read) ? "Yes" : "No"
      end
			row "Sent?" do
      	(message.sent) ? "Yes" : "No"
      end
			row 'Sent at' do
				message.created_at
			end
		end
	end
	
	controller do
		before_filter :mark_read, :only => [:show]
    def mark_read
			resource.mark_as_read
    end
  end

end
