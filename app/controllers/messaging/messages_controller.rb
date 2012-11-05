class Messaging::MessagesController < ApplicationController
	
	def new
		@message = Messaging::Message.new
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
			
			render "failed"
			
		end
		
	end
	
	#def chapter
	#	
	#	@chapter = Chapter.find(params[:id])
	#	if @chapter.nil?
	#		not_found
	#	end
	#	
	#	@message = Messaging::Message.new
	#	
	#end

 #def partner
 #	@message = Messaging::Message.new
 #	# notice = "Howdy Partner! Thanks for getting in touch, we'll get back to you shortly"
 #end
	
end
