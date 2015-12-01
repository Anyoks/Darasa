Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook_access_token, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # "530023173816084", "9f4f50c7ae95157af953957007a9b5b2",
  provider :facebook_access_token, ENV['530023173816084'], ENV['9f4f50c7ae95157af953957007a9b5b2'],
  	:client_options => {
  	      :site => 'https://graph.facebook.com/v2.5',
  	      :authorize_url => "https://www.facebook.com/v2.0/dialog/oauth"
  	    }
end