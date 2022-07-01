# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Views
gem 'simple_form', '~> 5.0'
gem 'slim'
gem 'slim-rails'
# Auth
gem 'devise'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rspec_junit_formatter'
  gem 'rubocop-rspec', '~> 2.9.0'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 1.26.1'
  gem 'rubocop-performance', '~> 1.13.3', require: false
  gem 'rubocop-rails', '~> 2.14.2', require: false
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', '~> 0.17.1', require: false
  gem 'webdrivers'
end

# Others
gem 'cloudinary'
gem 'coffee-rails'
gem 'friendly_id', '~> 5.2.4'
gem 'geocoder'
gem 'gmaps4rails'
gem 'pagy'
gem 'paperclip', '~> 6.0.0'
gem 'paperclip-cloudinary'
gem 'select2-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Trix
gem 'image_processing', '~> 1.12'

# API
gem 'fast_jsonapi'

# env
gem 'config'
gem 'dotenv-rails', groups: %i[development test]
gem 'rails_12factor'
gem 'sendgrid-ruby'

# Storage
gem 'fog', '2.1.0'

gem 'acts-as-taggable-on', '~> 9.0'
gem 'ancestry'
gem 'bootstrap'
gem 'jquery-rails'
gem 'nationality', '~> 1.0.7'
gem 'paranoia'
gem 'summernote-rails'

gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

gem 'pundit'
gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
