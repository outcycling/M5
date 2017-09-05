class AddColumnToManagePhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :manage_photos, :user_id, :integer
  end
end
