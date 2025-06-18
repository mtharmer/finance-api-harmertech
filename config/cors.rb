Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  allow do
    origins '*' # ENV['VITE_FINANCE_URL']
    resource '*',
      headers: :any,
      methods: :any,
      expose: %w(Authorization Uid),
      max_age: 600,
      credentials: true
  end
end
