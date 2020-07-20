require "rails_helper"

RSpec.describe Plant, type: :model do
  it "has a common name" do
    plant = Plant.new(common_name: "Monstera")
    expect(plant.common_name).to eq("Monstera")
  end

  it "common name is unique" do
    user = User.create!(email: "test@test.com", password: "123456")
    Plant.create!(common_name: "Monstera", user: user)
    plant = Plant.new(common_name: "Monstera")
    expect(plant).not_to be_valid
  end

  it "has a nickname" do
    plant = Plant.new(nickname: "Monsti")
    expect(plant.nickname).to eq("Monsti")
  end

  it "has a scientific name" do
    plant = Plant.new(scientific_name: "Monstera deliciosa")
    expect(plant.scientific_name).to eq("Monstera deliciosa")
  end

  it "has a description" do
    plant = Plant.new(description: "easy going")
    expect(plant.description).to eq("easy going")
  end

  it "has a watering_interval" do
    plant = Plant.new(watering_interval: 10)
    expect(plant.watering_interval).to eq(10)
  end

  it "common name can not be blank" do
    plant = Plant.new(common_name: "")
    expect(plant).to_not be_valid
  end

  it "has many watering events" do
    plant = Plant.new(common_name: "Monstera")
    expect(plant).to respond_to(:watering_events)
    expect(plant.watering_events.count).to eq(0)
  end

  it "belongs to a user" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.new(common_name: "Monstera", user: user)
    expect(plant.user).to eq(user)
  end

  it "should destroy child watering_events when destroying self" do
    user = User.create!(email: "test@test.com", password: "123456")
    plant = Plant.create!(common_name: "Monstera", user: user)
    WateringEvent.create!(date: Date.today, plant: plant)
    expect { plant.destroy }.to change { plant.watering_events.count }.from(1).to(0)
  end
end
