require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "has a date" do
    notification = Notification.new(date: Date.today)
    expect(notification.date).to eq(Date.today)
  end

  it "belongs to a plant" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user, watering_interval: 10)
    notification = Notification.new(date: Date.today, plant: plant)
    expect(notification.date).to eq(Date.today)
  end
end
