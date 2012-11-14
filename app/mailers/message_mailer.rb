class MessageMailer < ActionMailer::Base
   
	def notify(message)
		mail(:subject => "New Good for Nothing Challenge Submission")
	end

	def challenge_submission(message)
    @submission = message.submission
		mail(:subject => "New Good for Nothing Challenge Submission")
  end
  
  def partner_submission(message)
    @submission = message.submission
		mail(:subject => "Good for Nothing Partner Request")
  end
  
end
