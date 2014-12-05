class Messaging::PartnersController < ApplicationController

	def new
		@submission = Messaging::Partner.new
		@submission.message = Messaging::Message.new				
	end
	
	def done
	end

	def create
		
		@submission = Messaging::Partner.create(params[:messaging_partner])
		
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
				MessageMailer.partner_submission(@submission.message).deliver
			end
			redirect_to done_messaging_partners_path
		else
			render failure_messaging_messages_path
		end
		
	end
	
end
