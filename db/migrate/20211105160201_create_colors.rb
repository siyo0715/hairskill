class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.integer :user_id
      t.string :title
      t.text :detail
      t.string :color_image_id
      t.integer :evaluation
      t.timestamps
    end
  end
end
