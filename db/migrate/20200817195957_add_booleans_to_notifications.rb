class AddBooleansToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :needs_water, :boolean, default: false
    add_column :notifications, :needs_fertilizer, :boolean, default: false
  end
end
