class AddParentIdToStory < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :parent_id, :integer
  end
end
