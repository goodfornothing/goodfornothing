class Messaging::ChallengesController < ApplicationController

	def new
		@submission = Messaging::Challenge.new	
		@submission.message = Messaging::Message.new			
	end

	def chapter
		
		@chapter = Chapter.find(params[:id])
		if @chapter.nil?
		  not_found
		end
		
		@recipients = @chapter.users.crew
		@recipients = Chapter.find_by_title('London').users.crew if @recipients.nil?
		@submission = Messaging::Challenge.create(params[:messaging_challenge])	
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
			recipients = (Rails.env.production?) ? Chapter.find_by_id(params[:chapter_id]).users.crew : [User.find_by_email("ed@madebyfieldwork.com")]
			@submission.message.users << recipients
			if @submission.message.recipients.any?
				MessageMailer.challenge_submission(@submission.message).deliver
				redirect_to done_messaging_challenges_path
			end
		else
			render failure_messaging_messages_path
		end
		
	end
	
end
