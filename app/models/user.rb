class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	
	def self.omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user
			user.provider = auth.provider
			user.facebook_id = auth.info.uid
			user.name = auth.info.name
			user.profile_image = auth.info.image
			user.facebook_token = auth.credentials.token
			user.expires_at=Time.at(auth.credentials.expires_at)
			user.save!
		end
	end

end

