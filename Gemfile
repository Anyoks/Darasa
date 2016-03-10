source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use mysql as the database for Active Record
# gem 'mysql2', '~> 0.3.20'
# Use SCSS for stylesheets
gem 'pg'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'json', '~> 1.8.3'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
group :development do
	gem 'html2haml'
	#gem 'activeadmin', github: 'gregbell/active_admin' #styling up my admin
	gem 'capistrano', '~> 3.4.0'
	gem 'capistrano-rails', '~> 1.1.5'
	gem 'capistrano-rvm', github: "capistrano/rvm"
	gem 'capistrano-passenger'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
# gem 'minitest', '~> 5.8', '>= 5.8.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # gem 'omniauth'
  # gem 'omniauth-google-oauth2', git: 'https://github.com/zquestz/omniauth-google-oauth2.git'
  # gem 'omniauth-oauth2', '~> 1.4'
  # gem 'pesapal' #intergrating Mpesa payment
end

group :production do  
  gem 'minitest', '~> 5.8', '>= 5.8.2'
  gem 'omniauth'
  gem 'omniauth-google-oauth2', git: 'https://github.com/zquestz/omniauth-google-oauth2.git'
  gem 'omniauth-oauth2', '~> 1.4'
  gem 'pesapal' #intergrating Mpesa payment

end 

gem 'bootstrap-sass' #enables bootstrap in te app
gem 'carrierwave' #used image uploads 
gem 'mini_magick' #used image uploads 
gem 'puma' #web server
gem 'haml-rails'
gem 'devise', '~> 3.5', '>= 3.5.2'

gem 'unicorn' #better deployment server for deployment
#** enabling google signs
gem 'omniauth-facebook'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'simple_form', '~> 3.2'
gem 'cocoon', '~> 1.2', '>= 1.2.6'
gem "cancan"
gem 'devise-token_authenticatable', '~> 0.4.0'
gem 'jbuilder', '~> 2.3', '>= 2.3.2'
gem 'yajl-ruby', '~> 1.2', '>= 1.2.1'
gem 'annotate', '~> 2.6', '>= 2.6.10'
gem 'mobile-money'
gem 'oauth', '~> 0.4.7'
gem 'seed_dump', '~> 3.2', '>= 3.2.2'
gem 'sidekiq'
gem 'httparty', '~> 0.13.7'
gem 'rufus-scheduler', '~> 3.1', '>= 3.1.10'

#for to mount sidekiq dashboar
gem 'sinatra' , require: false
gem 'slim'

#capistrano-sidekiq for deployment
gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
#for formatting video
gem 'carrierwave-video'
#for video thumbs
gem 'carrierwave-video-thumbnailer'
#remote fb login
gem 'omniauth-facebook-access-token'
#remote fb login
gem 'fb_graph2'
#one session per user
gem 'devise_security_extension'
#charts
gem 'groupdate'
gem "chartkick"
#last seen user
gem 'rego-devise-lastseenable', '~> 0.1.0'
gem 'devise_lastseenable', '~> 0.0.6'

#Act as Paranoid
gem "paranoia", "~> 2.0"
#pagination
# gem 'will_paginate', '~> 3.0.5'
gem 'will_paginate-bootstrap'