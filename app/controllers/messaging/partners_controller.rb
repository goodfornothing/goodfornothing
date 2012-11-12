class Messaging::PartnersController < ApplicationController

	def new
		@submission = Messaging::Partner.new
		@submission.message = Messaging::Message.new				
	end
	
	def done
	end

	def create
		
		@submission = Messaging::Partner.create(params[:messaging_partner])
		@submission.message = Messaging::Message.new if @submission.message.nil?	
		@submission.message.user = current_user if user_signed_in?
		
		if @submission.save
			AdminMailer.partner_submission(@submission).deliver
			redirect_to done_messaging_partners_path
		else
			render failure_messaging_messages_path
		end
		
	end
	
end
