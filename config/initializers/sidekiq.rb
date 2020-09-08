if Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      url: 'redis://redis:6379/12'
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      url: 'redis://redis:6379/12'
    }
  end

elsif Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 1 }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 5 }
  end
end

schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
