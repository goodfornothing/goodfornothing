class AuthenticationsController < ApplicationController

  def twitter
    # raise omni = request.env["omniauth.auth"].to_yaml
    #3 Possibilities:
    #There exists a user, who has not authenticated his/her twitter account yet.
    #There is maybe a person, who is going to register to our website by authenticating the Twitter.
    #There is maybe a user, who is already authenticated before. We will need to create a new user and a new authentication. There wil not be an email address, or a password

    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication #authentication already exists
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user #user already logged in
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
     
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else #new user and new authentication needs creating.
      user = User.new
      user.name = omni['info']['name']
      user.name = "Mr Test"
      user.apply_omniauth(omni)
     
      # if user.save
        # flash[:notice] = "Logged in."
        # sign_in_and_redirect User.find(user.id)
      # else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      # end
    end

  end

  def facebook
    # raise omni = request.env["omniauth.auth"].to_yaml
    #3 Possibilities:
    #There exists a user, who has not authenticated his/her facebook account yet.
    #There is maybe a person, who is going to register to our website by authenticating the Facebook.
    #There is maybe a user, who is already authenticated before. We will need to create a new user and a new authentication. Email address is provided by omniauth

    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication #authentication already exists
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user #user already logged in
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
     
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else #new user and new authentication needs creating.
      user = User.new
      user.name = omni['info']['name']
      user.email = omni['extra']['raw_info'].email
      user.apply_omniauth(omni)
     
      # if user.save
        # flash[:notice] = "Logged in."
        # sign_in_and_redirect User.find(user.id)
      # else
        session[:omniauth] = omni
        redirect_to new_user_registration_path
      # end
    end

  end

end
