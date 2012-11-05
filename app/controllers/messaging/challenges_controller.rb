class Messaging::ChallengesController < ApplicationController

	def new
		
		@submission = Messaging::Challenge.new
		@submission.message = Messaging::Message.new
		
		# We'll be back in touch when we've had a wee think. If you don't hear back from us in a week, <a href="http://www.twitter.com/g00dfornothing">give us a nudge</a> on Twitter.
		
	end

	def create
		
		@submission = Messaging::Challenge.create(params[:messaging_challenge])
		@submission.message.user = current_user
		
		if @submission.save
		
	 		unless @submission.message.sent?
				@submission.message.send_to_recipients
			end
		
			render "messages/done"
		
		else
			
			render "messages/failed"
			
		end
		
	end
	
end
