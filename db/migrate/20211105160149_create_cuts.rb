class CreateCuts < ActiveRecord::Migration[5.2]
  def change
    create_table :cuts do |t|
      t.integer :user_id
      t.string :title
      t.text :detail
      t.string :cut_image_id
      t.integer :evaluation
      t.timestamps
    end
  end
end
