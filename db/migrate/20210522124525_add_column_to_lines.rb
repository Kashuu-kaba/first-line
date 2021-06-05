class AddColumnToLines < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :content, :text
    add_column :lines, :book_title, :text
    add_column :lines, :user_id, :integer
    add_column :lines, :type_id, :integer
  end
end
