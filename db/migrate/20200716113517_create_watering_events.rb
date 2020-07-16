class CreateWateringEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :watering_events do |t|
      t.date :date
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
