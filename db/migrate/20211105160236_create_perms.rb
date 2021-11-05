class CreatePerms < ActiveRecord::Migration[5.2]
  def change
    create_table :perms do |t|
      t.integer :user_id
      t.string :title
      t.text :detail
      t.string :perm_image_id
      t.integer :evaluation
      t.timestamps
    end
  end
end
