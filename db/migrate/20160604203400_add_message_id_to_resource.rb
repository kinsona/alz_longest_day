class AddMessageIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :message_id, :integer, null: false
  end
end
