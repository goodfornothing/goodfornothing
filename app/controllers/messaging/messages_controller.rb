class Messaging::MessagesController < ApplicationController
	
	def new
		@message = Messaging::Message.new
		@recipient = ::User.first
	end

	def create
		
		@message = Messaging::Message.create(params[:message])
		@message.user = current_user
		
		if @message.save
	 		unless @message.sent?
				@message.send_to_recipients
			end
			render "done"
		else
			render "fail"
		end
		
	end
	
end
