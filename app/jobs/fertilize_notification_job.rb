class FertilizeNotificationJob < ApplicationJob
  queue_as :default

  def perform
    @plants = Plant.includes(:fertilizing_events)
    @plants.each do |plant|
      next unless plant.fertilizing_events.present? && plant.fertilizing_interval.present?

      last_fertilizing_event = FertilizingEvent.where(plant: plant).order("date DESC").first[:date]
      next_fertilizing_event = last_fertilizing_event + plant.fertilizing_interval
      FertilizerNotification.create(date: Date.today + 7, plant: plant) if next_fertilizing_event == Date.today + 7
    end
  end
end
