class CreateWaterNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :water_notifications do |t|
      t.references :plant, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
