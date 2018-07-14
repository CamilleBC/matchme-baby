class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true
      t.string :image
      t.boolean :image_processing
      t.string :image_tmp

      t.timestamps
    end
  end
end
