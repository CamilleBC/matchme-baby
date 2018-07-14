class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.belongs_to :user, index: true
      t.string :media
      t.boolean :media_processing
      t.string :media_tmp
      t.string :type

      t.timestamps
    end
  end
end
