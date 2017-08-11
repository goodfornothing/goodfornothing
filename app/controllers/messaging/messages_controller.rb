class Messaging::MessagesController < ApplicationController
		
	before_filter :authenticate_user!, :only => :member
 
	def chapter
		
		@chapter = Chapter.find(params[:id])
		if @chapter.nil?
		  not_found
		end
		
		@message = Messaging::Message.new
		@recipients = @chapter.users.crew
		
		@recipients = Chapter.find_by_title('Mothership').users.crew if @recipients.nil?
		
	end
	
	def member
		
		@recipient = User.find(params[:id])
		if @recipient.nil?
		  not_found
		end
		
		if @recipient.can_be_contacted?
			@message = Messaging::Message.new	
		else
			redirect_to member_path(@recipient)
		end
		
	end
	
	def failure
	end

	def create
		
		@message = Messaging::Message.create(params[:messaging_message])
		@message.user = current_user if user_signed_in?
		
		if !is_spam_message?(@message)

			if @message.save
							
				if @message.recipients.any?
					MessageMailer.notice(@message).deliver
				end
				
				redirect_to done_messaging_messages_path
				
			else
				render "failure"
			end

		else
			redirect_to('/how-it-works') 
		end
		
	end
	
end
