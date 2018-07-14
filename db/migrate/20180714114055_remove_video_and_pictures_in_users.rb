class RemoveVideoAndPicturesInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :video
    remove_column :users, :pictures
  end
end
