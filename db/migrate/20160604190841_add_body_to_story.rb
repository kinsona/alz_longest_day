class AddBodyToStory < ActiveRecord::Migration
  def change
    add_column :stories, :body, :text, null: false
  end
end
