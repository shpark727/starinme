OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '885412518243880', '32d2fd1321a7bf522e8bdb61c996921a'
end

