class Delete < ActiveRecord::Migration[6.1]
  def change
    drop_table :line_hierarchies
    drop_table :middles
    drop_table :story_hierarchies
    drop_table :types
  end
end
