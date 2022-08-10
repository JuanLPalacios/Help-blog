class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id

      t.timestamps
    end
    add_index :likes, :author_id
  end
end
