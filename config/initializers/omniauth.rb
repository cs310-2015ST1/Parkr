
  OmniAuth.config.logger = Rails.logger

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '430593653815849', '25799011407298a48e1ff085d1b808e2'
  end
