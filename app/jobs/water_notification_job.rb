class WaterNotificationJob < ApplicationJob
  queue_as :default

  def perform
    @plants = Plant.includes(:watering_events)
    @plants.each do |plant|
      next unless plant.watering_events.present? && plant.watering_interval.present?

      last_watering_event = WateringEvent.where(plant: plant).order("date DESC").first[:date]
      next_watering_event = last_watering_event + plant.watering_interval
      WaterNotification.create(date: Date.today + 7, plant: plant) if next_watering_event == Date.today + 7
    end
  end
end
