if Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      port: ENV['REDIS_PORT'] || '6379'
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      port: ENV['REDIS_PORT'] || '6379'
    }
  end
end

if Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDISTOGO_URL'], size: 2 }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDISTOGO_URL'], size: 20 }
  end
end

schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
