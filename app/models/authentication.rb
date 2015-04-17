class Authentication < ActiveRecord::Base

  attr_accessible :provider, :uid, :token, :token_secret, :user_id

  belongs_to :user

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.token = auth.token
      authentication.token_secret = auth.token_secret
    end
  end
  
end