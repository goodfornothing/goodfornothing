class Messaging::PartnersController < ApplicationController

	def new
		@submission = Messaging::Partner.new				
	end

	def create
		
		@submission = Messaging::Partner.create(params[:messaging_partner])
		@submission.message = Messaging::Message.new		
		@submission.message.user = current_user if user_signed_in?
		
		if @submission.save
			
			AdminMailer.partner_submission(@submission).deliver
			
			redirect_to messaging_partner_confirm_path
			
		else
			
			render messaging_failure_path
			
		end
		
	end
	
end
