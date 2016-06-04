class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :story_id, null: false
      t.integer :user_one_id, null: false
      t.integer :user_two_id, null: false

      t.timestamps null: false
    end

    add_index :conversations, :story_id
  end
end
