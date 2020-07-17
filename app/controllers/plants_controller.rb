class PlantsController < ApplicationController
  def index
    @plants = Plant.where(user: current_user)
  end
end
