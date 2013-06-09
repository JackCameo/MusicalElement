class AddLibraryIdToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :library_id, :integer
  end
end
