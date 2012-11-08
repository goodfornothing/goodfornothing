#class Messaging:ChaptersController < ApplicationController
#
#	def new
#		
#		#	@chapter = Chapter.find(params[:id])
#		#	if @chapter.nil?
#		#		not_found
#		#	end
#		
#		@submission = Messaging::Partner.new
#		
#	end
#	
#	def done
#	end
#
#	def create
#		
#		@submission = Messaging::Chapter.create(params[:messaging_partner])
#		@submission.message = Messaging::Message.new		
#		@submission.message.user = current_user if user_signed_in?
#		
#		if @submission.save
#			
#			AdminMailer.partner_submission(@submission).deliver
#			
#			redirect_to done_messaging_partners_path
#			
#		else
#			
#			render messaging_failure_path
#			
#		end
#		
#	end
#	
#end
