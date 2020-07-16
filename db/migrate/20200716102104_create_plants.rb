class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :nickname
      t.string :description
      t.time :watering_intervall

      t.timestamps
    end
  end
end
