class Messaging::ChallengesController < ApplicationController

	def new
		@submission = Messaging::Challenge.new	
		@submission.message = Messaging::Message.new			
	end
	
	def done
	end

	def create
				
		@submission = Messaging::Challenge.create(params[:messaging_challenge])		

		if @submission.message.nil?
			@message = Messaging::Message.new
			@message.user = current_user if user_signed_in?
			@submission.message = @message
		elsif user_signed_in?
			@submission.message.user = current_user 
		end
		
		if @submission.save
			@submission.message.send_to_recipients
			redirect_to done_messaging_challenges_path
		else
			render failure_messaging_messages_path
		end
		
	end
	
end
