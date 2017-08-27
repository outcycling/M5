class CreateGratitudes < ActiveRecord::Migration[5.0]
  def change
    create_table :gratitudes do |t|
      t.integer :user_id
      t.string :entry

      t.timestamps
    end
  end
end
