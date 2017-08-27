class CreateWritings < ActiveRecord::Migration[5.0]
  def change
    create_table :writings do |t|
      t.integer :user_id
      t.string :headline
      t.text :body

      t.timestamps
    end
  end
end
