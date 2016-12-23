class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
    add_index :friendships, :first_user_id
    add_index :friendships, :second_user_id
    add_index :friendships, [:first_user_id,:second_user_id], unique: true
  end
end
