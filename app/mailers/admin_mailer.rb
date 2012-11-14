class AdminMailer < ActionMailer::Base
  
  default from: "GFN Hive Mind <crew@goodfornothing.com>",
          to: (Rails.env.production?) ? Chapter.find_by_title('London').users.crew.map(&:email) : "andrew@goodfornothing.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New Good for Nothing Member")
  end

	def new_comment(comment)
    @comment = comment
    mail(:subject => "New comment on Good for Nothing")
  end
  
  def crew_activation(member)
    @user = member
    mail(:to => member.email, :subject => "Your account is ready for re-activation")
  end

end
