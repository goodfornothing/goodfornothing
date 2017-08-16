class AdminMailer < ActionMailer::Base
  
  default from: "GFN Hive Mind <crew@goodfornothing.com>",
          to: (Rails.env.production?) ? "hello@goodfornothing.com" : "ed@madebyfieldwork.com"
  
  def new_user(user)
    @user = user
    mail(:subject => "New Good for Nothing Member")
  end

  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Good for Nothing")
  end

	def new_comment(comment)
    @comment = comment
    mail(:subject => "New comment on Good for Nothing")
  end
  
  def crew_activation(member)
    @user = member
    mail(:to => member.email, :subject => "Your account is ready for re-activation")
  end

	def published_trill(trill)
    @trill = trill
    mail(:to => "hello@goodfornothing.com", :subject => "Someone's published a new Trill")
  end
  
  def made_payment
    mail(:subject => "Someone's made a payment")    
  end

end
