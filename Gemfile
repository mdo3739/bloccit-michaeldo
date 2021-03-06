source 'https://rubygems.org'


group :production do
	gem 'pg'
	gem 'rails_12factor'
end
group :development do
	gem 'sqlite3'
	gem 'pry-rails'
	gem "rails-erd"
  gem 'spring-commands-rspec'  # makes loading rspec files soooo much faster. sike!
end


gem 'bootstrap-sass'  # handles css
gem 'faker'           # creates fake data for seeds
gem 'quiet_assets'    # hides asset pipeline logs
gem 'devise'          # user authentication
gem 'figaro', '1.0'   # handles sensitive data
gem 'pundit'          # authorization
gem 'redcarpet'       # markdown language
gem 'carrierwave'     # allows uploading of files
gem 'mini_magick'     # image library and image manipulation
gem 'fog'             # cloud storage system for images (supports amazon s3)
gem 'will_paginate', '~> 3.0.5'
gem 'newrelic_rpm'
gem 'puma'
gem 'factory_girl_rails', '~> 4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'debugger'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
end

