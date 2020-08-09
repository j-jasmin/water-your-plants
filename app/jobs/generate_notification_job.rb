class GenerateNotificationJob < ApplicationJob
  queue_as :default

  def perform
    plants = Plant.all
    plants.each do |plant|
      if plant.watering_events
        event = WateringEvent.where(plant: plant).order("date DESC").first[:date]
        unless event.nil?
          next_event = event + plant.watering_interval
          Notification.create(date: Date.today, plant: plant) if next_event == Date.today
        end
      end
    end
  end
end



# def perform
#     plants = Plant.all
#     plants.each do |plant|
#       if plant.watering_event.present?
#         next_event = plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date] + plant.watering_interval
#     end
#   end



# plants.each do |plant|
#       if plant.watering_events.present? && plant.watering_interval.present?
#         next_event = plant.watering_events.sort { |a, b| b.date <=> a.date }[0][:date] + plant.watering_interval
#         if next_event == Date.today
#           notification = Notification.new(date: Date.today, plant: plant)
#           notification.save if notification.valid?
#         end
