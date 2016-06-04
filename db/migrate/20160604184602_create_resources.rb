class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :story_id, null: false
      t.text :body, null: false

      t.timestamps null: false
    end

    add_index :resources, :story_id
  end
end
