require 'dynamoid'

Dynamoid.configure do |config|
  config.namespace = "finance_#{Rails.env}"
  config.read_capacity = 5
  config.write_capacity = 5
  config.timestamps = true
  config.backoff = { exponential: { base_backoff: 0.2.seconds, ceiling: 10 } }

  config.access_key = ENV['AWS_ACCESS_KEY']
  config.secret_key = ENV['AWS_SECRET_ACCESS_KEY']
  config.region = 'us-east-1'
end
