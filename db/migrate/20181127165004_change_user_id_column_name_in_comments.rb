class ChangeUserIdColumnNameInComments < ActiveRecord::Migration[5.2]
  def up
    rename_column :comments, :user_id, :login
  end

  def down
    rename_column :comments, :login, :user_id
  end
end
