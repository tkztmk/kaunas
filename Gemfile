source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'sqlite3'

gem 'jquery-rails'
gem 'rails_config'
gem 'redcarpet'

gem 'yaml_db'

group :production do
  gem 'passenger'
  gem 'mysql2'
end

group :production, :assets do
  gem 'less-rails'
  gem 'coffee-rails'
  gem 'slim-rails'
  gem 'therubyracer', platforms: :ruby
  gem 'therubyrhino', platforms: :jruby
  gem 'uglifier'
end

group :development do
  gem 'guard-livereload'
end

group :development, :test do
  gem 'rspec-rails'
end

