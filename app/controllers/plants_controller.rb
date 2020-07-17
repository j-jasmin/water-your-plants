class PlantsController < ApplicationController
  before_action :set_plant, only: :show

  def index
    @plants = Plant.where(user: current_user)
  end

  def show; end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name)
  end
end
