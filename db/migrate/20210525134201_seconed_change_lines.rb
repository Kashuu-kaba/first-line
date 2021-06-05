class SeconedChangeLines < ActiveRecord::Migration[6.1]
  def change
    remove_column :lines, :middle_id, :integer
    add_column :lines, :jenru, :integer, default: 0, null: false, limit: 1
  end
end
