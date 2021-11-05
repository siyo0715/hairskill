class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :user_id
      t.string :title
      t.text :detail
      t.string :image_id
      t.integer :evaluation
      t.timestamps
    end
  end
end
