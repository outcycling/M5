class CreateManagePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :manage_photos do |t|
      t.integer :requestor_id
      t.integer :requestee_id
      t.string :granted

      t.timestamps
    end
  end
end
