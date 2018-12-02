class AddLinkFieldToMovie < ActiveRecord::Migration[5.2]
  def up
    add_column :movies, :link, :string
  end

  def down
    remove_column :movies, :link
  end
end
