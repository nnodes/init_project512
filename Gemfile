source 'https://rubygems.org'
ruby '2.6.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# ADDED
gem 'awesome_print', '~> 1.9.2'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git'
gem 'axlsx_rails', '~> 0.6.1'
gem 'bootstrap-datepicker-rails', '~> 1.6.4'
gem 'bootstrap-sass',             '~> 3.3.6'
gem 'cancancan',                  '~> 3.1.0'
gem 'ckeditor',                   '~> 4.2.4'
gem 'devise',                     '~> 4.8.0'
gem 'dotenv-rails',               '~> 2.7.6'
gem 'jasny-bootstrap-rails',      '~> 3.1.3'
gem 'jcrop-rails-v2', '~> 0.9.12.3'
gem 'jquery-validation-rails', '~> 1.16.0'
gem 'paperclip', '~> 5.2.0'
gem 'pg', '~> 1.2.3'
gem 'rubyzip', '>= 1.2.1'
gem 'simple_form', '~> 5.1.0'
gem 'will_paginate', '~> 3.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'letter_opener'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
