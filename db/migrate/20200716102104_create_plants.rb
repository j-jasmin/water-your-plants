class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :nickname
      t.string :description
      t.integer :watering_interval

      t.timestamps
    end
  end
end
