# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.6'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.5', '>= 7.1.5.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

gem 'factory_bot_rails', '~> 6.5'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 7.1'
  gem 'rubocop-factory_bot', '~> 2.27'
  gem 'rubocop-rails', '~> 2.32'
  gem 'rubocop-rake', '~> 0.7.1'
  gem 'rubocop-rspec', '~> 3.6'
  gem 'rubocop-rspec_rails', '~> 2.31'
end

group :test do
  gem 'faker', '~> 3.5'
  gem 'shoulda-matchers', '~> 6.5'
  gem 'simplecov', '~> 0.22.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'devise', '~> 4.9'
gem 'jsonapi-serializer', '~> 2.2'

gem 'devise-jwt', '~> 0.12.1'

gem "aws-sdk-rails", "~> 5.1"
gem "aws-actionmailer-ses", "~> 1.0"
