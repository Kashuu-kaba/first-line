class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :line_comment, :text
  end
end
