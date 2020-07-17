require 'faker'

user = User.create!(email: "jasmin@test.com", password: "123456")

10.times do
  plant = Plant.new(
    name: Faker::TvShows::BigBangTheory.unique.character,
    user: user
    )
  plant.save!
  puts "Saving #{plant.name}"
end
