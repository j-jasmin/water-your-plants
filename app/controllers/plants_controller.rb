class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :destroy]

  def index
    @plants = Plant.where(user: current_user)
  end

  def show
    @watering_event = WateringEvent.new
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

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :nickname, :watering_interval, :photo)
  end
end
