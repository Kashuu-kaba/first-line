class AddParentIdToLine < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :parent_id, :integer
  end
end
