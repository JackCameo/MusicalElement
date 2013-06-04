class AddPrivateToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :private, :boolean, :default => true
  end
end
