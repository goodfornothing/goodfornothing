class AuthFailure < Devise::FailureApp
  def redirect_url
     new_user_session_url(:authfailure=>true)
  end
end