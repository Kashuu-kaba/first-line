class CreateStoryHierarchies < ActiveRecord::Migration[6.1]
  def change
    create_table :story_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :story_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "story_anc_desc_idx"

    add_index :story_hierarchies, [:descendant_id],
      name: "story_desc_idx"
  end
end
