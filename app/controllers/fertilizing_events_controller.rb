class FertilizingEventsController < ApplicationController
  def create
    @fertilizing_event = FertilizingEvent.new(fertilizing_event_params)
    @plant = Plant.find(params[:plant_id])
    @fertilizing_event.plant = @plant
    redirect_to plant_path(@plant) if @fertilizing_event.save
  end

  private

  def fertilizing_event_params
    params.require(:fertilizing_event).permit(:date, :note)
  end
end
