class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :plants, :name, :common_name
  end
end
