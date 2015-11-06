Devise.secret_key = ENV['DEVISE_SECRET_KEY']

Devise.setup do |config|
  config.stretches = Rails.env.test? ? 1 : 10
end
