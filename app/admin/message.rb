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
	
	scope :direct_messages, :default => true do
		Messaging::Message.where("submission_type = ?", nil)
	end
	scope :partner_request do
		Messaging::Message.where("submission_type = ?", 'Messaging::Partner')
	end
	scope :challenge_submissions do
		Messaging::Message.where("submission_type = ?", 'Messaging::Challenge')
	end

	index do
    column("From") { |m| m.from_name }
		column("Read") { |m| status_tag((m.read) ? "Read" : "Unread") }
    column :created_at
		default_actions
  end

end
