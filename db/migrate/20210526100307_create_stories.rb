class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :line_id
      t.text :story_comment

      t.timestamps
    end
  end
end
