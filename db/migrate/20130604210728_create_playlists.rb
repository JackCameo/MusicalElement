class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :track_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
