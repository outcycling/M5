class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :desc
      t.boolean :main
      t.boolean :private
      t.integer :user_id

      t.timestamps
    end
  end
end
