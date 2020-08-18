class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.includes(:watering_events)
    plants.each do |plant|
      notification = Notification.new

      notification.needs_water = true if plant.needs_water?
      notification.needs_fertilizer = true if plant.needs_fertilizer?

      notification.save!
    end
  end
end
