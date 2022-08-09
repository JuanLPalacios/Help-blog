class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :users, column: :author_id, null: false
  end
end