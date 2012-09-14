class UserMailer < ActionMailer::Base
  
  default from: "Good for Nothing <hello@goodfornothing.com>"
  
  def reactivate_user(user)
    @user = user
    mail(:to => @user.email, :subject => "Good for Nothing Account Reactivation")
  end
  
end
