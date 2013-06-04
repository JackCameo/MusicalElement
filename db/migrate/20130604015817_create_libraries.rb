class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.integer :trakc_id
      t.integer :album_id

      t.timestamps
    end
  end
end
