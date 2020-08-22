require 'rails_helper'

RSpec.describe FertilizerNotification, type: :model do
  let(:monstera) do
    Plant.create!(common_name: "Monstera", watering_interval: 10)
  end

  it "has a date" do
    water_notification = WaterNotification.new(date: Date.today - 10)
    expect(water_notification.date).to eq(Date.today - 10)
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    water_notification = WaterNotification.create!(plant: plant, date: Date.today)
    expect(water_notification.plant).to eq(plant)
  end
end
