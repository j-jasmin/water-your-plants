require 'rails_helper'

RSpec.describe FertilizingEvent, type: :model do
  let(:monstera) do
    Plant.create!(common_name: "Monstera")
  end

  it "has a date" do
    fertilizing_event = FertilizingEvent.new(date: Date.today - 10)
    expect(fertilizing_event.date).to eq(Date.today - 10)
  end

  it "has a note" do
    fertilizing_event = FertilizingEvent.new(date: Date.today - 10, note: "10ml")
    expect(fertilizing_event.note).to eq("10ml")
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    fertilizing_event = FertilizingEvent.create!(plant: plant, date: Date.today)
    expect(fertilizing_event.plant).to eq(plant)
  end
end
