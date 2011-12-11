source :gemcutter
gem 'sinatra', '1.0'
gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'simple_form'
gem 'heroku'

# managing DB on heroku
gem 'rack', '1.3.3'

# database stuff

group :production do
  gem 'pg', '0.11.0'
end

group :development do
  gem 'mysql2'
  gem "taps"
end

#frontend-stuff
gem "haml", "~> 3.1.2"
gem "compass", "~> 0.12.alpha.0"
gem "compass-960-plugin"
gem 'sass', '~> 3.1.5'
gem 'will_paginate', '~> 3.0'
gem 'sass-rails'
gem 'tinymce-rails'
gem 'fastimage'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
