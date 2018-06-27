# frozen_string_literal: true

class RenameUsernameToNicknameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :nickname
  end
end
