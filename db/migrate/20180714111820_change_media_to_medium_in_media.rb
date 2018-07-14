class ChangeMediaToMediumInMedia < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :media, :medium
    change_column :media, :media_processing, :boolean, default: false
    rename_column :media, :media_processing, :medium_processing
    rename_column :media, :media_tmp, :medium_tmp
  end
end
