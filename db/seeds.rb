require 'httparty'
require "faker"

puts "Destroying users.."
User.destroy_all

puts "Destroying plants..."
Plant.destroy_all

puts "Destroying watering events.."
WateringEvent.destroy_all

puts "Destroying fertilizing events events.."
FertilizingEvent.destroy_all

puts "Destroying water notifications..."
WaterNotification.destroy_all

puts "Destroying fertilize notifications..."
FertilizerNotification.destroy_all

user = User.create!(name: "jasmin", email: "jasmin@test.com", password: "123456")

response = HTTParty.get(
  'https://trefle.io/api/v1/plants', format: :plain,
  query: {
    "token": ENV['TREFLE_KEY']
  }
)

plants = JSON.parse(response, symbolize_names: true)

plants[:data].each do |plant_info|

    plant = Plant.create!(
      common_name: plant_info[:common_name],
      scientific_name: plant_info[:scientific_name],
      nickname: Faker::Name.unique.name,
      watering_interval: 7,
      fertilizing_interval: 7,
      user: user
    )

  1.times do
    watering_event = WateringEvent.new(
      date: Date.today + 1,
      plant: plant,
      note: "One glass of water"
      )
    watering_event.save!
  end

  1.times do
    fertilizing_event = FertilizingEvent.new(
      date: Date.today + 1,
      plant: plant
      )
    fertilizing_event.save!
  end

  puts "Saving #{plant.common_name}..."
end

