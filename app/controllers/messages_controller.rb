class MessagesController < ApplicationController
	
	def chapter
		
		@chapter = Chapter.find(params[:id])
		if @chapter.nil?
			not_found
		end
		
		@message = Message.new
		
	end
	
	def member
		
		@member = User.find(params[:id])
		if @member.nil?
			not_found
		end
		
		@message = Message.new
		
	end
	
	def challenge
		@message = Message.new
		# We'll be back in touch when we've had a wee think. If you don't hear back from us in a week, <a href="http://www.twitter.com/g00dfornothing">give us a nudge</a> on Twitter.
	end
	
	def partner
		@message = Message.new
		# notice = "Howdy Partner! Thanks for getting in touch, we'll get back to you shortly"
	end

	def create
		
		@message.from = current_user
		#AdminMailer.new_challenge(@challenge).deliver
		
	end
	
end
