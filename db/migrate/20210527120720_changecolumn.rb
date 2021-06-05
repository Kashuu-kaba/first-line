class Changecolumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :stories, :ancestry, :string
    remove_column :lines, :parent_id, :integer
    add_column :stories, :parent_id, :integer
  end
end
