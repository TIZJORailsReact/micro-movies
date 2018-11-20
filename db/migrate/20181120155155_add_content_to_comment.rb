class AddContentToComment < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :content, :string
  end

  def down
    remove_column :comments, :content, :string
  end
end
