class AdminMailer < ActionMailer::Base
  
  default from: "GFN Hive Mind <crew@goodfornothing.com>",
          to: (Rails.env.production?) ? Chapter.find_by_title('London').users.crew.map(&:email) : "andrew@goodfornothing.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New Good for Nothing Member")
  end
  
  def challenge_submission(submission)
    @submission = submission
    mail(:subject => "New Good for Nothing Challenge Submission")
		@submission.message.mark_as_sent
  end
  
  def partner_submission(submission)
    @submission = submission
    mail(:subject => "Good for Nothing Partner Request")
		@submission.message.mark_as_sent
  end
  
  def crew_activation(member)
    @user = member
    mail(:to => member.email, :subject => "Your account is ready for re-activation")
  end
  
end
