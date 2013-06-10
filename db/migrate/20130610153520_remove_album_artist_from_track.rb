class RemoveAlbumArtistFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :album_artist
  end

  def down
    add_column :tracks, :album_artist, :string
  end
end
