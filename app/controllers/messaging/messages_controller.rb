class Messaging::MessagesController < ApplicationController
	
	# migrate content to messages table
  # remove_column :challenges, :contact
  # remove_column :partners, :purpose
  # remove_column :partners, :notes
  # remove_column :partners, :contact
	
	def new
		@message = Messaging::Message.new
		@recipient = ::User.first
	end
	
	def failure
	end

	def create
		
		@message = Messaging::Message.create(params[:message])
		@message.user = current_user if user_signed_in?
		
		if @message.save
	 		unless @message.sent?
				@message.send_to_recipients
			end
			render "done"
		else
			render "failure"
		end
		
	end
	
end
