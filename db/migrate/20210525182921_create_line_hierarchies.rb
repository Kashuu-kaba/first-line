class CreateLineHierarchies < ActiveRecord::Migration[6.1]
  def change
    create_table :line_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :line_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "line_anc_desc_idx"

    add_index :line_hierarchies, [:descendant_id],
      name: "line_desc_idx"
  end
end
