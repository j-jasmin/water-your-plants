class WateringEventsController < ApplicationController
  def create
    @watering_event = WateringEvent.new(watering_event_params)
    @plant = Plant.find(params[:plant_id])
    @watering_event.plant = @plant
    redirect_to plant_path(@plant) if @watering_event.save
  end

  private

  def watering_event_params
    params.require(:watering_event).permit(:date, :note)
  end
end
