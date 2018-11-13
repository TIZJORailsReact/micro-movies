class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :movies
      t.string :user_id
      t.timestamps
    end
  end
end
