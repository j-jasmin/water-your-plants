require 'rails_helper'

RSpec.describe FertilizerNotification, type: :model do
  let(:monstera) do
    Plant.create!(common_name: "Monstera", watering_interval: 10)
  end

  it "has a date" do
    fertilizer_notification = FertilizerNotification.new(date: Date.today - 10)
    expect(fertilizer_notification.date).to eq(Date.today - 10)
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    fertilizer_notification = FertilizerNotification.create!(plant: plant, date: Date.today)
    expect(fertilizer_notification.plant).to eq(plant)
  end
end
