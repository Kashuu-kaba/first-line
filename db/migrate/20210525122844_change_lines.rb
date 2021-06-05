class ChangeLines < ActiveRecord::Migration[6.1]
  def change
    remove_column :lines, :type_id, :integer
    add_column :lines, :middle_id, :integer
  end
end
