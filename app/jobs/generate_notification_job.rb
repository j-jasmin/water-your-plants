class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.all
    plants.each do |plant|
      next_event = plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date] + plant.watering_interval
      Notification.create!(date: Date.today, plant: plant) if next_event == Date.today
    end
  end
end
