class AdminMailer < ActionMailer::Base
  
  default from: "GFN Hive Mind <crew@goodfornothing.com>",
          to: (Rails.env.production?) ? Chapter.find_by_title('London').users.crew.map(&:email) : "andrew@goodfornothing.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New Good for Nothing Member")
  end
  
  def new_challenge(challenge)
    @challenge = challenge
    mail(:subject => "New Good for Nothing Challenge Submission")
  end
  
  def new_partner(partner)
    @partner = partner
    mail(:subject => "Good for Nothing Partner Request")
  end
  
  def crew_activation(member)
    @user = member
    mail(:to => member.email, :subject => "Your account is ready for re-activation")
  end
  
end
