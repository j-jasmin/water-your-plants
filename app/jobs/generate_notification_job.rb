class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.all
    plants.each do |plant|
      if plant.watering_events.present? && plant.watering_interval.present?
        next_event = plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date] + plant.watering_interval
        if next_event == Date.today
          notification = Notification.new(date: Date.today, plant: plant)
          notification.save if notification.valid?
        end
      end
    end
  end
end
