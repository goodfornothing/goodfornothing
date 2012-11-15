class MessageMailer < ActionMailer::Base
	
	default from: "GFN Hive Mind <crew@goodfornothing.com>"
   
	def notice(message)
		mail(:subject => "You have a new message on Good for Nothing", :to => message.users.map(&:email))
  end

	def challenge_submission(message)
    @submission = message.submission
		mail(:subject => "New Good for Nothing Challenge Submission", :to => message.users.map(&:email))
		message.mark_as_sent
  end
  
  def partner_submission(message)
    @submission = message.submission
		mail(:subject => "Good for Nothing Partner Request", :to => message.users.map(&:email))
  end

  def chapter_submission(message)
    @submission = message.submission
		mail(:subject => "Someone wants to start a new chapter", :to => message.users.map(&:email))
  end
  
end
