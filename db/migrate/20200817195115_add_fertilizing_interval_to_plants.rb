class AddFertilizingIntervalToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :fertilizing_interval, :integer
  end
end
