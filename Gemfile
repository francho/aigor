source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'foundation-rails'

# Websockets
gem 'faye-rails'
gem 'thin'
gem 'faye'
gem 'rake'

# SerialPort
gem 'serialport'

# Scheluder
gem 'rufus-scheduler', '~> 3.0.9'

# Publish-Subscribe capabilities
gem 'wisper'

group :development, :test do
  gem 'rspec', '~> 3.1.0'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec-core'
  gem 'rspec-mocks'
  gem 'rspec-expectations'
  gem 'rspec-support'

  gem 'capybara'
  gem 'capybara-webkit'

  gem 'launchy' # Launch browser when save_and_open_page method is called
end

group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-puma'
  # gem 'capistrano-nvm', require: false
end

group :production do
  gem 'puma'
  gem 'foreman'
end
