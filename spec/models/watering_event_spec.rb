require "rails_helper"

RSpec.describe WateringEvent, type: :model do
  let(:monstera) do
    Plant.create!(common_name: "Monstera")
  end

  it "has a date" do
    watering_event = WateringEvent.new(date: Date.today - 10)
    expect(watering_event.date).to eq(Date.today - 10)
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    watering_event = WateringEvent.create!(plant: plant)
    expect(watering_event.plant).to eq(plant)
  end
end
