class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :movie
      t.string :user, null: false
      t.timestamps
    end
  end
end
