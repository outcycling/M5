class AddColumnToReadings < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :visible, :boolean
  end
end
