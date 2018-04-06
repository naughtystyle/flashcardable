source "https://rubygems.org"

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "rack-cors", "~> 1.0.2"
gem "rails", "~> 5.1.5"

group :development, :test do
  gem "byebug", platforms: :mri
  gem "rspec-rails", "~> 3.7"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
end
