class Columncahnge < ActiveRecord::Migration[6.1]
  def change
    remove_column :stories, :parent_id, :integer
    add_column :stories, :story_id, :integer
  end
end
