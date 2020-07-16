require "rails_helper"

RSpec.describe Plant, type: :model do
  it "has a name" do
    plant = Plant.new(name: "Monstera")
    expect(plant.name).to eq("Monstera")
  end

  it "has a nickname" do
    plant = Plant.new(nickname: "Monsti")
    expect(plant.nickname).to eq("Monsti")
  end

  it "has a description" do
    plant = Plant.new(description: "easy going")
    expect(plant.description).to eq("easy going")
  end

  it "has a watering_intervall" do
    plant = Plant.new(watering_intervall: "497584")
    expect(plant.watering_intervall).to eq("497584")
  end

  it "name can not be blank" do
    plant = Plant.new(name: "")
    expect(plant).to_not be_valid
  end

  it "has many watering events" do
    plant = Plant.new(name: "Monstera")
    expect(plant).to respond_to(:watering_events)
    expect(plant.watering_events.count).to eq(0)
  end

  it "belongs to a user" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.new(name: "Monstera", user: user)
    expect(plant.user).to eq(user)
  end

  it "should destroy child watering_events when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(name: "Monstera", user: user)
    WateringEvent.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.watering_events.count }.from(1).to(0)
  end
end
