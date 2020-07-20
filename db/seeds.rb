require 'httparty'
require "open-uri"

puts "Destroying users.."
User.destroy_all

puts "Destroying plants..."
Plant.destroy_all

puts "Destroying watering events.."
WateringEvent.destroy_all

user = User.create!(email: "jasmin@test.com", password: "123456")

response = HTTParty.get(
  'https://trefle.io/api/v1/plants', format: :plain,
  query: {
    "token": ENV['TREFLE_KEY']
  }
)

plants = JSON.parse(response, symbolize_names: true)

plants[:data].each do |plant_info|

  file = URI.open(plant_info[:image_url])

    plant = Plant.create!(
      common_name: plant_info[:common_name],
      scientific_name: plant_info[:scientific_name],
      watering_interval: rand(3..10),
      user: user
    )
  plant.photo.attach(io: file, filename: "plant_image_#{plant[:common_name]}", content_type: 'image/png')

  rand(1..5).times do
    watering_event = WateringEvent.new(
      date: Date.today - rand(1..100),
      plant: plant
      )
    watering_event.save!
  end
  puts "Saving #{plant.common_name}..."
end

