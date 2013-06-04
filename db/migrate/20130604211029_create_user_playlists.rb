class CreateUserPlaylists < ActiveRecord::Migration
  def change
    create_table :user_playlists do |t|
      t.integer :playlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
