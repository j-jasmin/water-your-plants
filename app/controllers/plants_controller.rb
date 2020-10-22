class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy, :care]

  def index
    @plants = Plant.includes(:watering_events).where(user: current_user)
    upcoming_events = current_user.fertilizer_notifications.where("date > ?", Date.today - 7) +
                      current_user.water_notifications.where("date > ?", Date.today - 7)
    @sorted_upcoming_events = upcoming_events.sort_by(&:date)
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
    past_events = @plant.watering_events + @plant.fertilizing_events
    @sorted_past_events = past_events.sort_by(&:date)
  end

  private

  def set_plant
    @plant = Plant.friendly.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :nickname, :watering_interval, :fertilizing_interval, :photo)
  end
end
