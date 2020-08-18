require "rails_helper"

RSpec.describe WateringEvent, type: :model do
  let(:monstera) do
    Plant.create!(common_name: "Monstera")
  end

  it "has a date" do
    watering_event = WateringEvent.new(date: Date.today - 10)
    expect(watering_event.date).to eq(Date.today - 10)
  end

  it "has a note" do
    watering_event = WateringEvent.new(date: Date.today - 10, note: "one glass of water")
    expect(watering_event.note).to eq("one glass of water")
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    watering_event = WateringEvent.create!(plant: plant, date: Date.today)
    expect(watering_event.plant).to eq(plant)
  end
end
