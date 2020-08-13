require 'rails_helper'
Sidekiq::Testing.fake!

RSpec.describe GenerateNotificationJob, type: :job do
  it "creates notifications" do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    expect { GenerateNotificationJob.perform_later }.to have_performed_job(GenerateNotificationJob)
  end
end
