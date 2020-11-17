source 'https://rubygems.org/'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# server, db
gem 'rails', '~> 5.1'
gem 'mysql2', '~> 0.4.10'
gem 'puma', '~> 3.0'

# front-end
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'will_paginate-bootstrap'

# backend helpers
gem 'devise'
# gem 'simple_form'
# gem 'client_side_validations', github: 'DavyJonesLocker/client_side_validations', branch: 'rails5'
# gem 'client_side_validations-simple_form', github: 'DavyJonesLocker/client_side_validations-simple_form', branch: 'rails5'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'will_paginate', '~> 3.1.0'
gem "paperclip", "~> 5.0.0"
gem 'cancancan'

# gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'capistrano-rails', group: :development
  gem 'capistrano-rvm', group: :development
  gem 'capistrano-passenger', group: :development
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
