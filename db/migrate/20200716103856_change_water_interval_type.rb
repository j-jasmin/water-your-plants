class ChangeWaterIntervalType < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :watering_intervall, :interval
  end
end
