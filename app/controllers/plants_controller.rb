class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy, :care]

  def index
    @plants = Plant.includes(:watering_events).where(user: current_user)
    @plants.each do |plant|
      @watering_event = plant.watering_events.order("date DESC").first[:date] if plant.watering_events.present?
      @fertilizing_event = plant.fertilizing_events.order("date DESC").first[:date] if plant.fertilizing_events.present?
    end
  end

  def show
    @watering_event = WateringEvent.new
    @fertilizing_event = FertilizingEvent.new
  end

  def new
    @plant = Plant.new
  end

  def create
    plant = Plant.new(plant_params)
    plant.user = current_user
    if plant.save
      redirect_to plant_path(plant)
    else
      render :new
    end
  end

  def destroy
    redirect_to root_path if @plant.destroy
  end

  def care
    @watering_events = @plant.watering_events
    @fertilizing_events = @plant.fertilizing_events
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :nickname, :watering_interval, :fertilizing_interval, :photo)
  end
end
