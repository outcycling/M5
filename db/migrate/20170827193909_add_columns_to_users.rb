class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :zip, :string
    add_column :users, :name, :string
  end
end
