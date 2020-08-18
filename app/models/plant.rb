class Plant < ApplicationRecord
  has_one_attached :photo

  validates :watering_interval, presence: true

  has_many :watering_events, dependent: :destroy
  has_many :fertilizing_events, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user

  def needs_water?
    return unless plant.watering_events.present?

    last_watering_event = WateringEvent.where(plant: plant).order("date DESC").first[:date]
    next_watering_event = last_watering_event + plant.watering_interval
    next_watering_event == Date.today + 5
  end

  def needs_fetilizer?
    return unless plant.fertilizing_events.present?

    last_fertilizing_event = FertilizingEvent.where(plant: plant).order("date DESC").first[:date]
    next_fertilizing_event = last_fertilizing_event + plant.fertilizing_interval
    next_fertilizing_event == Date.today + 5
  end
end
