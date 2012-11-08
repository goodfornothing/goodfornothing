class Messaging::ChallengesController < ApplicationController

	def new
		@submission = Messaging::Challenge.new	
		@submission.message = Messaging::Message.new			
	end
	
	def done
	end

	def create
		
		@submission = Messaging::Challenge.create(params[:messaging_challenge])
		@submission.message = Messaging::Message.new if @submission.message.nil?
		@submission.message.user = current_user if user_signed_in?
		
		if @submission.save
			AdminMailer.challenge_submission(@submission).deliver
			redirect_to done_messaging_challenges_path
		else
			render messaging_failure_path
		end
		
	end
	
end
