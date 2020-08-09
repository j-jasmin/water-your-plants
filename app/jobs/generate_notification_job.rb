class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.all
    plants.each do |plant|
      if plant.watering_events
        event = WateringEvent.where(plant: plant).order("date DESC").first[:date]
        if event
          next_event = event + plant.watering_interval
          Notification.create(date: Date.today, plant: plant) if next_event == Date.today
        end
      end
    end
  end
end
