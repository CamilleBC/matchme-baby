class AddAvatarIdToMedia < ActiveRecord::Migration[5.2]
  def change
    add_reference :media, :avatar, unique: true
  end
end
