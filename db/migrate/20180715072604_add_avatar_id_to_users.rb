class AddAvatarIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :avatar, unique: true
  end
end
