class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.all
    plants.each do |plant|
    #   next_event = plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date] + plant.watering_interval
    #   if next_event == Date.today
    #     notification = Notification.new(date: Date.today, plant: plant)
    #     notification.save if notification.valid?
    #   end
      p plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date]
    end
  end
end
