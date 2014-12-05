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
			recipients = (Rails.env.production?) ? Chapter.find_by_title('London').users.crew : [User.find_by_email("ed@madebyfieldwork.com")]
			@submission.message.users << recipients
			if @submission.message.recipients.any?
				MessageMailer.challenge_submission(@submission.message).deliver
			end
			redirect_to done_messaging_challenges_path
		else
			render failure_messaging_messages_path
		end
		
	end
	
end
