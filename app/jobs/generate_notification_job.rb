class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.include(:watering_events)
    plants.each do |plant|
      next unless plant.watering_events.present?

      last_watering_event = WateringEvent.where(plant: plant).order("date DESC").first[:date]
      next_watering_event = last_watering_event + plant.watering_interval
      Notification.create(date: Date.today, plant: plant, needs_water: true) if next_watering_event == Date.today
    end
  end
end
