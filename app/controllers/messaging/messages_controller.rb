class Messaging::MessagesController < ApplicationController
	
	# migrate content to messages table
  # remove_column :challenges, :contact
  # remove_column :partners, :purpose
  # remove_column :partners, :notes
  # remove_column :partners, :contact
		
	def chapter
		
		@chapter = Chapter.find(params[:id])
		if @chapter.nil?
		  not_found
		end
		
		@message = Messaging::Message.new
		@recipients = @chapter.users.crew
		
		@recipients = Chapter.find_by_title('London').users.crew if @recipients.nil?
		
	end
	
	def failure
	end

	def create
		
		@message = Messaging::Message.create(params[:messaging_message])
		@message.user = current_user if user_signed_in?
		
		if @message.save
						
			if @message.recipients.any?
				MessageMailer.notice(@message).deliver
			end
			
			redirect_to done_messaging_messages_path
			
		else
			render "failure"
		end
		
	end
	
end
