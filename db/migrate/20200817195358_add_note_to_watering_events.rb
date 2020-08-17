class AddNoteToWateringEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :watering_events, :note, :string
  end
end
